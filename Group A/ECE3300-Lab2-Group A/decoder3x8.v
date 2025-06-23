`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 05:36:17 PM
// Design Name: 
// Module Name: decoder3x8
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


module decoder3x8(
    input [0:2] in,
    input enable,
    output [7:0] out
    );
    assign out[0] = ~in[0] & ~in[1] & ~in[2] & enable;
    assign out[1] = ~in[0] & ~in[1] & in[2] & enable;
    assign out[2] = ~in[0] & in[1] & ~in[2] & enable;
    assign out[3] = ~in[0] & in[1] & in[2] & enable;
    assign out[4] = in[0] & ~in[1] & ~in[2] & enable;
    assign out[5] = in[0] & ~in[1] & in[2] & enable;
    assign out[6] = in[0] & in[1] & ~in[2] & enable;
    assign out[7] = in[0] & in[1] & in[2] & enable;
endmodule
