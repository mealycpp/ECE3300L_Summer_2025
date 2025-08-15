`timescale 1ns/1ps
module load_fsm_tb;

  // 50 MHz clock
  reg clk = 1'b0;
  localparam integer CLK_HALF_NS = 10;
  always #(CLK_HALF_NS) clk = ~clk;

  // DUT I/O
  reg  rst = 1'b1;        // active-high
  reg  load_pulse = 1'b0;
  wire [3:0] slot_onehot;
  wire wr_res, wr_r, wr_g, wr_b;

  // Instantiate DUT (active-high reset, no external 'slot' port)
  load_fsm dut (
    .clk(clk),
    .rst(rst),
    .load_pulse(load_pulse),
    .slot_onehot(slot_onehot),
    .wr_res(wr_res),
    .wr_r(wr_r),
    .wr_g(wr_g),
    .wr_b(wr_b)
  );

  integer errors = 0;

  function [3:0] rotl1(input [3:0] v);
    rotl1 = {v[2:0], v[3]};
  endfunction

  // Expectation + check during one pulse, then confirm next slot
  task pulse_and_check(input [3:0] expected_oh);
    reg wr_ok;
    reg [3:0] next_oh;
  begin
    // Drive one-cycle pulse
    load_pulse = 1'b1;
    @(posedge clk);

    // Check one-hot matches current slot and write enables
    wr_ok = 1'b0;
    case (expected_oh)
      4'b0001: wr_ok = (wr_res == 1'b1) && (wr_r==0) && (wr_g==0) && (wr_b==0);
      4'b0010: wr_ok = (wr_r   == 1'b1) && (wr_res==0) && (wr_g==0) && (wr_b==0);
      4'b0100: wr_ok = (wr_g   == 1'b1) && (wr_res==0) && (wr_r==0) && (wr_b==0);
      4'b1000: wr_ok = (wr_b   == 1'b1) && (wr_res==0) && (wr_r==0) && (wr_g==0);
      default: wr_ok = 1'b0;
    endcase

    if (slot_onehot !== expected_oh || !wr_ok) begin
      $display("[load_fsm] FAIL during pulse: slot_onehot=%b expected=%b  wr_res/r/g/b=%b%b%b%b",
               slot_onehot, expected_oh, wr_res, wr_r, wr_g, wr_b);
      errors = errors + 1;
    end else begin
      $display("[load_fsm] PASS during pulse: slot_onehot=%b  wr OK", slot_onehot);
    end

    // Deassert pulse and check that slot advanced on next cycle
    load_pulse = 1'b0;
    @(posedge clk);
    next_oh = rotl1(expected_oh);
    if (slot_onehot !== next_oh) begin
      $display("[load_fsm] FAIL next state: got %b expected %b", slot_onehot, next_oh);
      errors = errors + 1;
    end else begin
      $display("[load_fsm] PASS next state: %b", slot_onehot);
    end
  end
  endtask

  initial begin
    // Optional VCD
    `ifdef DUMP_VCD
      $dumpfile("load_fsm_tb.vcd");
      $dumpvars(0, load_fsm_tb);
    `endif

    // Reset
    rst = 1'b1; @(posedge clk); @(posedge clk);
    rst = 1'b0; @(posedge clk);

    // After reset, expect slot = 0 => onehot 0001, no write strobes
    if (slot_onehot !== 4'b0001 || wr_res || wr_r || wr_g || wr_b) begin
      $display("[load_fsm] FAIL after reset: slot_onehot=%b (exp 0001), wr=%b%b%b%b",
               slot_onehot, wr_res, wr_r, wr_g, wr_b);
      errors = errors + 1;
    end else begin
      $display("[load_fsm] PASS after reset: slot_onehot=0001");
    end

    // Drive 8 pulses to check two full wraps
    pulse_and_check(4'b0001);  // RES
    pulse_and_check(4'b0010);  // R
    pulse_and_check(4'b0100);  // G
    pulse_and_check(4'b1000);  // B
    pulse_and_check(4'b0001);  // wrap -> RES
    pulse_and_check(4'b0010);
    pulse_and_check(4'b0100);
    pulse_and_check(4'b1000);

    if (errors == 0) $display("load_fsm: All tests PASSED.");
    else             $display("load_fsm: %0d test(s) FAILED.", errors);

    $finish;
  end

endmodule
