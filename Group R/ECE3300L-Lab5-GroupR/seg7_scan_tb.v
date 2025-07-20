`timescale 1ns / 1ps

module seg7_scan_tb;

  reg clk;
  reg [3:0] digit0, digit1;
  wire [6:0] SEG;
  wire [1:0] AN;

  // Instantiate DUT
  seg7_scan uut (
    .clk(clk),
    .digit0(digit0),
    .digit1(digit1),
    .SEG(SEG),
    .AN(AN)
  );

  // 100 MHz clock
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("Starting seg7_scan_tb...");

    digit0 = 4'd3;
    digit1 = 4'd7;

    #500;  // Allow enough cycles to alternate AN[0] and AN[1]

    $stop;
  end

endmodule
