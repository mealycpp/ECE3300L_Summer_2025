`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 07/01/2025 12:28:38 PM
// Design Name: 16x1 Multiplexer
// Module Name: mux16x1
// Project Name: 16x1 Mux
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This is a 16x1 multiplexer created by instantiaing 2x1 muxes
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux16x1(
    input [15:0] in, 
    input [3:0] sel, 
    output out
);
    wire [15:0] level1;
    wire [7:0] level2;
    wire [3:0] level3;
    
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1)
            mux2x1 m1 (.a(in[2*i]), .b(in[2*i+1]), .sel(sel[0]), .y(level1[i]));
        for (i = 0; i < 4; i = i + 1)
            mux2x1 m2 (.a(level1[2*i]), .b(level1[2*i+1]), .sel(sel[1]), .y(level2[i]));
        for (i = 0; i < 2; i = i + 1)
            mux2x1 m3 (.a(level2[2*i]), .b(level2[2*i+1]), .sel(sel[2]), .y(level3[i]));
        mux2x1 m4 (.a(level3[0]), .b(level3[1]), .sel(sel[3]), .y(out));
    endgenerate
endmodule
