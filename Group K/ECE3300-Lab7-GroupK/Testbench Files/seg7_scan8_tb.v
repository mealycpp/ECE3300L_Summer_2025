`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomon
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 08:24:30 PM
// Design Name: 
// Module Name: seg7_scan8_tb
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


module seg7scan8_tb;
  reg clk;
  reg rst_n;
  reg [3:0] onesP;
  reg [3:0] tensP;
  reg [3:0] hundredsP;
  reg [3:0] thousandsP;
  wire [6:0] SEG;
  wire [7:0] AN;

  seg7scan8 uut (
    .clk(clk),
    .rst_n(rst_n),
    .onesP(onesP),
    .tensP(tensP),
    .hundredsP(hundredsP),
    .thousandsP(thousandsP),
    .SEG(SEG),
    .AN(AN)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 0;
    onesP = 4'd0;
    tensP = 4'd0;
    hundredsP = 4'd0;
    thousandsP = 4'd0;

    #20 rst_n = 1;

    onesP = 4'd3;
    tensP = 4'd5;
    hundredsP = 4'd7;
    thousandsP = 4'd9;

    #200000;

    $finish;
  end

endmodule
