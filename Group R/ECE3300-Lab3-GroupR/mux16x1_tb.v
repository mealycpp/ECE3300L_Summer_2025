`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 04:10:49 PM
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


`timescale 1ns / 1ps

module mux16x1_tb;

  reg [15:0] in;
  reg [3:0] sel;

  
  wire out;

  mux16x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  `timescale 1ns / 1ps

  initial begin
    // First test pattern
    in = 16'b0000111100001111;
    $display("----- Testing pattern: 0000111100001111 -----");
    for (integer i = 0; i < 16; i = i + 1) begin
      sel = i;
      #10;
      $display("sel=%b , output = %b, expected_output = %b",  sel, out, in[i]);
    end

    // Second test pattern
    in = 16'b0101010101010101;
    $display("----- Testing pattern: 0101010101010101 -----");
    for (integer i = 0; i < 16; i = i + 1) begin
      sel = i;
      #10;
      $display("sel=%b , output = %b, expected_output = %b", sel, out, in[i]);
    end

    // Third test pattern
    in = 16'b1001100110011001;
    $display("----- Testing pattern: 1001100110011001 -----");
    for (integer i = 0; i < 16; i = i + 1) begin
      sel = i;
      #10;
      $display("sel=%b , output = %b, expected_output = %b", sel, out, in[i]);
    end

    $finish;
  end

endmodule


