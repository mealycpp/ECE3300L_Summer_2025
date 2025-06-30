`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 04:33:30 PM
// Design Name: 
// Module Name: mux16x1
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


module mux16x1(
input [15:0] in, 
input [3:0] sel,
output out
    );
/* 16x1 mux requires 4 levels of 2x1 muxes: lvl 1 : 8, lvl 2: 4, lvl 3: 2, lvl 4: 1*/
wire [15:0] level1; 
wire [7:0]  level2;
wire [3:0]  level3;
genvar i;
generate
for (i = 0; i < 8; i = i + 1)
mux2x1 m1 (.a(in[2*i]), .b(in[2*i+1]), .sel(sel[0]), .y(level1[i])); // instantiate 8 2x1 mux for level 1
for (i = 0; i < 4; i = i + 1)
mux2x1 m2 (.a(level1[2*i]), .b(level1[2*i+1]), .sel(sel[1]), .y(level2[i])); // instantiate 4 2x1 mux for level 2
for (i = 0; i < 2; i = i + 1)
mux2x1 m3 (.a(level2[2*i]), .b(level2[2*i+1]), .sel(sel[2]), .y(level3[i])); // instantiate 2 2x1 mux for level 3

mux2x1 m4 (.a(level3[0]), .b(level3[1]), .sel(sel[3]), .y(out)); // instantiate 1 2x1 mux for last level
endgenerate

endmodule
