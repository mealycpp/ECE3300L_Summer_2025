`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 12:04:28 PM
// Design Name: 
// Module Name: seg7_scan_tb
// Project Name: seg7_scan_tb
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seg7_scan_tb;
  reg clk = 0;
  reg rst_n = 0;
  reg [3:0] digit0 = 4'd5;
  reg [3:0] digit1 = 4'd9;
  reg [3:0] digit2 = 4'd3;
  wire [6:0] seg;
  wire [2:0] an;
  
  seg7_scan uut (
    .clk(clk),
    .rst_n(rst_n),
    .digit0(digit0),
    .digit1(digit1),
    .digit2(digit2),
    .seg(seg),
    .an(an)
  );

  always #5 clk = ~clk;

  initial begin
    rst_n = 0; #20;
    rst_n = 1;
    #500;
    $stop;
  end
endmodule
