`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:43:41 PM
// Design Name: 
// Module Name: seg7_scan_tb
// Project Name: 
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


module seg7_scan_tb(

    );
  reg  clk   = 0;
  reg  rst_n = 0;
  reg  [7:0] bits = 8'h42;    
  //value: 0x2-0x4
  wire [6:0] SEG;
  wire [7:0] AN;
  wire       DP;

  seg7_scan uut (.CLK(clk), .rst_n(rst_n), .bits(bits),
                 .SEG(SEG), .AN(AN), .DP(DP));

  always #5 clk = ~clk;

  initial begin
    #20  rst_n = 1;

    #500_000 bits = 8'h99;

    #500_000 $finish;
  end
    
endmodule
