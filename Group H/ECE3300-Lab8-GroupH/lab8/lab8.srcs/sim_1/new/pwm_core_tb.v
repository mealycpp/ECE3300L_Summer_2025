`timescale 1ns/1ps
module pwm_core_tb;

  // 50 MHz clock
  reg clk = 1'b0;
  localparam integer CLK_HALF_NS = 10;
  always #(CLK_HALF_NS) clk = ~clk;

  // DUT I/O
  reg        rst = 1'b1;   // active-high
  reg  [7:0] period;
  reg  [7:0] dr, dg, db;
  wire       pr, pg, pb;

  // Instantiate DUT (active-high reset version)
  pwm_core dut (
    .clk   (clk),
    .rst   (rst),
    .period(period),
    .duty_r(dr),
    .duty_g(dg),
    .duty_b(db),
    .pwm_r (pr),
    .pwm_g (pg),
    .pwm_b (pb)
  );

  integer errors = 0;
  integer case_num = 0;

  // Run one case: reset counter, run for one effective period, count highs, compare.
  task run_case;
    input [7:0] t_period;
    input [7:0] t_dr, t_dg, t_db;
    integer exp_ep, exp_r, exp_g, exp_b;
    integer meas_r, meas_g, meas_b;
    integer i;
  begin
    case_num = case_num + 1;

    // Drive inputs
    period = t_period;
    dr = t_dr; dg = t_dg; db = t_db;

    // Reset to force cnt=0
    rst = 1'b1; @(posedge clk); @(posedge clk);
    rst = 1'b0; @(posedge clk);

    // Expected effective period and clamped duties
    exp_ep = t_period + 1;
    exp_r  = (t_dr >= exp_ep) ? (exp_ep - 1) : t_dr;
    exp_g  = (t_dg >= exp_ep) ? (exp_ep - 1) : t_dg;
    exp_b  = (t_db >= exp_ep) ? (exp_ep - 1) : t_db;

    // Measure highs across exactly one effective period
    meas_r = 0; meas_g = 0; meas_b = 0;
    for (i = 0; i < exp_ep; i = i + 1) begin
      @(posedge clk);
      meas_r = meas_r + pr;
      meas_g = meas_g + pg;
      meas_b = meas_b + pb;
    end

    // Compare
    if (meas_r !== exp_r || meas_g !== exp_g || meas_b !== exp_b) begin
      $display("[pwm_core][CASE %0d] FAIL  period=%0d eff=%0d  got R/G/B=%0d/%0d/%0d  exp=%0d/%0d/%0d",
               case_num, t_period, exp_ep, meas_r, meas_g, meas_b, exp_r, exp_g, exp_b);
      errors = errors + 1;
    end else begin
      $display("[pwm_core][CASE %0d] PASS  period=%0d eff=%0d  R/G/B=%0d/%0d/%0d",
               case_num, t_period, exp_ep, meas_r, meas_g, meas_b);
    end
  end
  endtask

  initial begin
    // Optional VCD
    `ifdef DUMP_VCD
      $dumpfile("pwm_core_tb.vcd");
      $dumpvars(0, pwm_core_tb);
    `endif

    // Global init
    period = 0; dr = 0; dg = 0; db = 0;
    rst = 1'b1; repeat (3) @(posedge clk); rst = 1'b0;

    // Case 1: eff=8; expect R/G/B = 2/4/6
    run_case(8'd7, 8'd2, 8'd4, 8'd6);

    // Case 2: clamp duties > eff-1 (eff=8); expect R=7, G=0, B=7
    run_case(8'd7, 8'd200, 8'd0, 8'd9);

    // Case 3: RES=0 -> eff=1; always low (0 highs)
    run_case(8'd0, 8'd0, 8'd1, 8'd255);

    // Case 4: eff=16 with mid-range duties
    run_case(8'd15, 8'd5, 8'd8, 8'd12);

    if (errors == 0) $display("All pwm_core tests PASSED.");
    else             $display("%0d pwm_core test(s) FAILED.", errors);

    $finish;
  end

endmodule
