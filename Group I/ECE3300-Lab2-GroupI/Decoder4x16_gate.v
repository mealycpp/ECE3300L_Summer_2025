`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 04:45:24 PM
// Design Name: 
// Module Name: Decoder4x16_Gate
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


module Decoder4x16_Gate(
    input wire [3:0] A,
    input wire E,
    output wire [15:0] Y
    );
    
    assign Y[0] = E & ~A[3] & ~A[2] & ~A[1] & ~A[0]; // Binary # 0
    assign Y[1] = E & ~A[3] & ~A[2] & ~A[1] & A[0]; // Binary # 1
    assign Y[2] = E & ~A[3] & ~A[2] & A[1] & ~A[0]; // Binary # 2
    assign Y[3] = E & ~A[3] & ~A[2] & A[1] & A[0]; // Binary # 3
    assign Y[4] = E & ~A[3] & A[2] & ~A[1] & ~A[0]; // Binary # 4
    assign Y[5] = E & ~A[3] & A[2] & ~A[1] & A[0]; // Binary # 5
    assign Y[6] = E & ~A[3] & A[2] & A[1] & ~A[0]; // Binary # 6
    assign Y[7] = E & ~A[3] & A[2] & A[1] & A[0]; // Binary # 7 
    assign Y[8] = E & A[3] & ~A[2] & ~A[1] & ~A[0]; // Binary # 8
    assign Y[9] = E & A[3] & ~A[2] & ~A[1] & A[0]; // Binary # 9
    assign Y[10] = E & A[3] & ~A[2] & A[1] & ~A[0]; // Binary # 10
    assign Y[11] = E & A[3] & ~A[2] & A[1] & A[0]; // Binary # 11
    assign Y[12] = E & A[3] & A[2] & ~A[1] & ~A[0]; // Binary # 12
    assign Y[13] = E & A[3] & A[2] & ~A[1] & A[0]; // Binary # 13
    assign Y[14] = E & A[3] & A[2] & A[1] & ~A[0]; // Binary # 14
    assign Y[15] = E & A[3] & A[2] & A[1] & A[0]; // Binary # 15
    
endmodule

