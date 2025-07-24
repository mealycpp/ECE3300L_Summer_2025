`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:48:17 AM
// Design Name: 
// Module Name: bcd_counter_tb
// Project Name: bcd_counter_tb
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

module bcd_counter_tb;
  reg clk = 0;
  reg rst_n = 0;
  reg dir = 1;  // 1 = up, 0 = down
  wire [3:0] bcd;

    bcd_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .BCD(bcd)
  );

  always #10 clk = ~clk;

  initial begin
    rst_n = 0; #20;
    rst_n = 1;
    #200;
    dir = 0;
    #200;
    $stop;
  end
endmodule
