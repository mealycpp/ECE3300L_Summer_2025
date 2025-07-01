`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2025 10:24:11 PM
// Design Name: 
// Module Name: mux16x1_tb
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

module mux16x1_tb;
  reg [15:0] in;
  reg [3:0] sel;
  wire out;
  mux16x1 uut (.in(in), .sel(sel), .out(out));
  initial begin
    in = 16'b1010_0101_1100_0011;
    for (sel = 0; sel < 16; sel = sel + 1) begin
      #10;
      $display("sel=%d, out=%b", sel, out);
    end
    $finish;
  end
endmodule

