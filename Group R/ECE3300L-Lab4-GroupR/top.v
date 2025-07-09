`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 03:05:40 PM
// Design Name: 
// Module Name: top
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


module top(
  input clk,
  input rst_n,
  input [15:0] sw,
  output [15:0] led,
  output [6:0] Cnode,
  output dp,
  output [7:0] AN
           );
   
   
  assign led = sw;  // Mirror switches to LEDs
 

  wire [31:0] sw_ext = {sw, sw};  // Zero-extend to match 32-bit input

  seg7_driver display(
    .clk(clk),
    .rst_n(rst_n),
    .sw(sw_ext),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
  );        
  
endmodule
