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
    input rst_n,
    input [9:0] switchInput,
    output [9:0] LEDoutput,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN
);

    wire [31:0] SW;
    
    Decoder10to32 dec(.selectPart(switchInput[9:8]), .partValue(switchInput[7:0]), .out(SW));
    seg7_driver driver(.clk(clk), .rst_n(rst_n), .SW(SW), .Cnode(Cnode), .dp(dp), .AN(AN));
    
    assign LEDoutput = switchInput;

endmodule
