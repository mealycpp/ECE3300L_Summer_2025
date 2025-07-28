`timescale 1ns / 1ps

module seg7_scan_tb;
  reg clk = 0;
  reg [3:0] digit0 = 4'd5;
  reg [3:0] digit1 = 4'd9;
  reg [3:0] digit2 = 4'd3;
  wire [6:0] seg;
  wire [2:0] an;

  seg7_scan uut (
    .clk(clk),
    .digit0(digit0),
    .digit1(digit1),
    .digit2(digit2),
    .seg(seg),
    .an(an)
  );

  always #5 clk = ~clk;

  initial begin
    #500;
    $stop;
  end
endmodule
