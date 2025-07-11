`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 05:38:10 PM
// Design Name: 
// Module Name: Driver
// Project Name: Lab_4
// Target Devices: Nexys A7
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


module Driver(
  input clk,
  input rst_n,
  input [15:0] SW_in,   // 4 bits per digit for 4 digits
  output [15:0] LED,
  output [6:0] Cnode,   // 7-segment cathodes
  output dp,
  output [7:0] AN       // Digit enables
);

  assign LED = SW_in;

  wire [31:0] SW = {16'd0, SW_in}; // Upper 16 bits = 0, lower 16 bits = SW_in

  seg7_driver driver(
    .clk(clk),
    .rst_n(rst_n),
    .SW(SW),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
  );

endmodule
