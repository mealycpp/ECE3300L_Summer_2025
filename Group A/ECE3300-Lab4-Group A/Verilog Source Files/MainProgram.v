`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 03:12:22 AM
// Design Name: 
// Module Name: MainProgram
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


module MainProgram(
    input clk,
    input [10:0] SW_in,     // [10] rst_n, [9:8] digit, [7:0] input
    output [10:0] led,
    output [6:0] Cnode,     // 7-seg [a-g]
    output dp,              
    output [7:0] AN         // 7-seg enable lines
);

    wire [31:0] SW;
    
    Decoder10to32 decoder(.SW_in(SW_in[9:0]), .out(SW));
    seg7_driver driver(.clk(clk), .rst_n(SW_in[10]), .SW(SW), .Cnode(Cnode), .dp(dp), .AN(AN));
    
    assign led = SW_in;

endmodule
