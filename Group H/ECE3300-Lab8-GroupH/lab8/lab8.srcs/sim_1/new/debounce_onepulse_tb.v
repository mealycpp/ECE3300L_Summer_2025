`timescale 1ns/1ps
module debounce_onepulse_tb;

  // 50 MHz clock
  reg clk = 1'b0;
  localparam integer CLK_HALF_NS = 10;
  always #(CLK_HALF_NS) clk = ~clk;

  // Parameters
  localparam integer STABLE_TICKS = 4;  // small for fast sim

  // DUT I/O
  reg  rst  = 1'b1;   // active-high
  reg  din  = 1'b0;
  wire pulse;

  // Instantiate DUT (active-high reset)
  debounce_onepulse #(.STABLE_TICKS(STABLE_TICKS)) dut (
    .clk  (clk),
    .rst  (rst),
    .din  (din),
    .pulse(pulse)
  );

  integer pulses = 0;
  integer width_errors = 0;
  reg prev_pulse = 1'b0;

  // Count pulses and ensure width == 1 clock
  always @(posedge clk) begin
    if (pulse && !prev_pulse) pulses = pulses + 1;        // rising edge
    if (pulse &&  prev_pulse) width_errors = width_errors + 1; // wider than 1
    prev_pulse <= pulse;
  end

  // Helpers
  task hold_cycles(input integer n); integer i; begin
    for (i = 0; i < n; i = i + 1) @(posedge clk);
  end endtask

  initial begin
    // Optional VCD
    `ifdef DUMP_VCD
      $dumpfile("debounce_onepulse_tb.vcd");
      $dumpvars(0, debounce_onepulse_tb);
    `endif

    // Reset
    rst = 1'b1; hold_cycles(3); rst = 1'b0; hold_cycles(5);
    din = 1'b0;

    // ---- Press with bounce (should emit exactly 1 pulse) ----
    din = 1'b1; @(posedge clk);
    // 2 quick bounces (< STABLE_TICKS)
    din = 1'b0; @(posedge clk);
    din = 1'b1; @(posedge clk);
    din = 1'b0; @(posedge clk);
    din = 1'b1;
    // Now hold high stable long enough
    hold_cycles(STABLE_TICKS + 2);

    // ---- Release with bounce (no pulse on falling edge) ----
    din = 1'b0; @(posedge clk);
    din = 1'b1; @(posedge clk);
    din = 1'b0; @(posedge clk);
    // Hold low stable
    hold_cycles(STABLE_TICKS + 2);

    // ---- Second clean press (1 pulse) ----
    din = 1'b1;
    hold_cycles(STABLE_TICKS + 3);

    // Summary
    $display("[debounce] pulses=%0d (expected 2), width_errors=%0d (expected 0)",
             pulses, width_errors);

    if (pulses == 2 && width_errors == 0)
      $display("debounce_onepulse: PASS");
    else
      $display("debounce_onepulse: FAIL");

    $finish;
  end

endmodule
