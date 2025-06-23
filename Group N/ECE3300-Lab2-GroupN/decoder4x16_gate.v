`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California State Polytechnic University Pomona
// Engineer: Student Daniel and Student Kobe
// 
// Create Date: 06/22/2025 05:57:25 PM
// Design Name: 
// Module Name: decoder4x16_gate
// Project Name: Decoder4x16
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: Implement a 4-to-16 decoder with enable input.
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: This has been designed by Student Daniel and Student Kobe
//////////////////////////////////////////////////////////////////////////////////


module decoder4x16_gate(
    input wire [3:0] A, wire[4:4] E,
    output wire [15:0] Y
    );
    
    //Example for Y0 = 1 when E = 1 and A = 0000
    assign Y[0] = E[4] & ~A[3] & ~A[2] & ~A[1] & ~A[0];
    
    assign Y[1] = E[4] & ~A[3] & ~A[2] & ~A[1] & A[0]; 
    assign Y[2] = E[4] & ~A[3] & ~A[2] & A[1] & ~A[0];
    assign Y[3] = E[4] & ~A[3] & ~A[2] & A[1] & A[0];
    assign Y[4] = E[4] & ~A[3] & A[2] & ~A[1] & ~A[0];
    assign Y[5] = E[4] & ~A[3] & A[2] & ~A[1] & A[0];
    assign Y[6] = E[4] & ~A[3] & A[2] & A[1] & ~A[0];
    assign Y[7] = E[4] & ~A[3] & A[2] & A[1] & A[0];
    assign Y[8] = E[4] & A[3] & ~A[2] & ~A[1] & ~A[0];
    assign Y[9] = E[4] & A[3] & ~A[2] & ~A[1] & A[0];
    assign Y[10] = E[4] & A[3] & ~A[2] & A[1] & ~A[0];
    assign Y[11] = E[4] & A[3] & ~A[2] & A[1] & A[0];
    assign Y[12] = E[4] & A[3] & A[2] & ~A[1] & ~A[0];
    assign Y[13] = E[4] & A[3] & A[2] & ~A[1] & A[0];
    assign Y[14] = E[4] & A[3] & A[2] & A[1] & ~A[0];
    assign Y[15] = E[4] & A[3] & A[2] & A[1] & A[0];
    
    
endmodule
