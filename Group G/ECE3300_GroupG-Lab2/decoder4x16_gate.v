`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 08:30:40 PM
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
    input [3:0] A,
    input E,
    output [15:0] Y
    );
    decoder3x8 decoder0(.A(A[2:0]), .E(E & ~A[3]), .Y(Y[7:0]));
    decoder3x8 decoder1(.A(A[2:0]), .E(E & A[3]), .Y(Y[15:8]));
endmodule
 
