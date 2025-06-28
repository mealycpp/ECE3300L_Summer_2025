`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Jared Mocling and Kevin Tang
// 
// Create Date: 06/25/2025 04:35:25 PM
// Design Name: 4x16 decoder
// Module Name: decoder4x16_gates
// Project Name: ECE 3300 Lab 2
// Target Devices: NEXYS A7-100T FPGA
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module decoder4x16_gate(
    input wire [3:0] SW, wire[4:4] EN,
    output wire [15:0] Y
    );
    
    //Example for Y0 = 1 when E = 1 and A = 0000
    assign Y[0] = EN[4] & ~SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
    
    assign Y[1] = EN[4] & ~SW[3] & ~SW[2] & ~SW[1] & SW[0]; 
    assign Y[2] = EN[4] & ~SW[3] & ~SW[2] & SW[1] & ~SW[0];
    assign Y[3] = EN[4] & ~SW[3] & ~SW[2] & SW[1] & SW[0];
    assign Y[4] = EN[4] & ~SW[3] & SW[2] & ~SW[1] & ~SW[0];
    assign Y[5] = EN[4] & ~SW[3] & SW[2] & ~SW[1] & SW[0];
    assign Y[6] = EN[4] & ~SW[3] & SW[2] & SW[1] & ~SW[0];
    assign Y[7] = EN[4] & ~SW[3] & SW[2] & SW[1] & SW[0];
    assign Y[8] = EN[4] & SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
    assign Y[9] = EN[4] & SW[3] & ~SW[2] & ~SW[1] & SW[0];
    assign Y[10] = EN[4] & SW[3] & ~SW[2] & SW[1] & ~SW[0];
    assign Y[11] = EN[4] & SW[3] & ~SW[2] & SW[1] & SW[0];
    assign Y[12] = EN[4] & SW[3] & SW[2] & ~SW[1] & ~SW[0];
    assign Y[13] = EN[4] & SW[3] & SW[2] & ~SW[1] & SW[0];
    assign Y[14] = EN[4] & SW[3] & SW[2] & SW[1] & ~SW[0];
    assign Y[15] = EN[4] & SW[3] & SW[2] & SW[1] & SW[0];
    
    
endmodule