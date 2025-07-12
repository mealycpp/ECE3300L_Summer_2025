`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 05:50:42 PM
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
        input  [3:0]  A,
        input         E,
        output [15:0] Y    
    );
    
    assign Y[0] =  E & ~A[3] & ~A[2] & ~A[1] & ~A[0]; //Led 0
    assign Y[1] =  E & ~A[3] & ~A[2] & ~A[1] &  A[0]; //Led 1
    assign Y[2] =  E & ~A[3] & ~A[2] &  A[1] & ~A[0]; //Led 2
    assign Y[3] =  E & ~A[3] & ~A[2] &  A[1] &  A[0]; //Led 3
    assign Y[4] =  E & ~A[3] &  A[2] & ~A[1] & ~A[0]; //Led 4
    assign Y[5] =  E & ~A[3] &  A[2] & ~A[1] &  A[0]; //Led 5
    assign Y[6] =  E & ~A[3] &  A[2] &  A[1] & ~A[0]; //Led 6
    assign Y[7] =  E & ~A[3] &  A[2] &  A[1] &  A[0]; //Led 7
    assign Y[8] =  E &  A[3] & ~A[2] & ~A[1] & ~A[0]; //Led 8
    assign Y[9] =  E &  A[3] & ~A[2] & ~A[1] &  A[0]; //Led 9
    assign Y[10] = E &  A[3] & ~A[2] &  A[1] & ~A[0]; //Led 10
    assign Y[11] = E &  A[3] & ~A[2] &  A[1] &  A[0]; //Led 11
    assign Y[12] = E &  A[3] &  A[2] & ~A[1] & ~A[0]; //Led 12
    assign Y[13] = E &  A[3] &  A[2] & ~A[1] &  A[0]; //Led 13
    assign Y[14] = E &  A[3] &  A[2] &  A[1] & ~A[0]; //Led 14
    assign Y[15] = E &  A[3] &  A[2] &  A[1] &  A[0]; //Led 15
    
endmodule
