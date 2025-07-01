`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 10:26:32 PM
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
  wire [7:0] level1;
  wire [3:0] level2;
  wire [1:0] level3;
  // Level 1: 8 mux2x1
  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : L1
      mux2x1 m1 (.a(in[2*i]), .b(in[2*i+1]), .sel(sel[0]), .y(level1[i]));
    end
    // Level 2: 4 mux2x1
    for (i = 0; i < 4; i = i + 1) begin : L2
      mux2x1 m2 (.a(level1[2*i]), .b(level1[2*i+1]), .sel(sel[1]), .y(level2[i]));
    end
    // Level 3: 2 mux2x1
    for (i = 0; i < 2; i = i + 1) begin : L3
      mux2x1 m3 (.a(level2[2*i]), .b(level2[2*i+1]), .sel(sel[2]), .y(level3[i]));
    end
  endgenerate
  // Level 4: Final mux2x1
  mux2x1 m4 (.a(level3[0]), .b(level3[1]), .sel(sel[3]), .y(out));
endmodule

