`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 05:36:17 PM
// Design Name: 
// Module Name: decoder4x16_gate
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


module decoder4x16_gate(
    input [3:0] in,
    input enable,
    output [15:0] out
    );
    decoder3x8 decoder0(.in(in[2:0]), .enable(enable & ~in[3]), .out(out[7:0]));
    decoder3x8 decoder1(.in(in[2:0]), .enable(enable & in[3]), .out(out[15:8]));
endmodule
