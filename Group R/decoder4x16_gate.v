`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 08:22:17 PM
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
    
//assigning output values

// Enable LOW
    assign Y[0]  = E & ~A[3] & ~A[2] & ~A[1] & ~A[0];
    assign Y[1]  = E & ~A[3] & ~A[2] & ~A[1] &  A[0];
    assign Y[2]  = E & ~A[3] & ~A[2] &  A[1] & ~A[0];
    assign Y[3]  = E & ~A[3] & ~A[2] &  A[1] &  A[0];
    assign Y[4]  = E & ~A[3] &  A[2] & ~A[1] & ~A[0];
    assign Y[5]  = E & ~A[3] &  A[2] & ~A[1] &  A[0];
    assign Y[6]  = E & ~A[3] &  A[2] &  A[1] & ~A[0];
    assign Y[7]  = E & ~A[3] &  A[2] &  A[1] &  A[0];
// Enable HIGH
    assign Y[8]  = E &  A[3] & ~A[2] & ~A[1] & ~A[0];
    assign Y[9]  = E &  A[3] & ~A[2] & ~A[1] &  A[0];
    assign Y[10] = E &  A[3] & ~A[2] &  A[1] & ~A[0];
    assign Y[11] = E &  A[3] & ~A[2] &  A[1] &  A[0];
    assign Y[12] = E &  A[3] &  A[2] & ~A[1] & ~A[0];
    assign Y[13] = E &  A[3] &  A[2] & ~A[1] &  A[0];
    assign Y[14] = E &  A[3] &  A[2] &  A[1] & ~A[0];
    assign Y[15] = E &  A[3] &  A[2] &  A[1] &  A[0];
endmodule
