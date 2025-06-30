`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 07:46:46 PM
// Design Name: 
// Module Name: tb_mux16x1
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

module tb_mux16x1;
  reg  [15:0] in;
  reg  [3:0]  sel;
  wire        out;
  integer     i;

  mux16x1 test (.in(in), .sel(sel), .out(out));
  
  initial begin
  in = 16'b1010_0101_1010_0101;  // case 1: A5A5
  for (i = 0; i<16; i = i+1)
  begin
  sel = i; // loop 0-15; set select line to i each iteration
  #10; // 10 ns delay
  end
  #100
  in = 16'b1111_0110_1000_0111;  // case 2: F687
  for (i = 0; i<16; i = i+1)
  begin
  sel = i;
  #10; 
  end
  #100
  in = 16'b0110_1100_0101_1110;  // case 3: 6C5E
  for (i = 0; i<16; i = i+1)
  begin
  sel = i; 
  #10; 
  end
  $finish;
  end
endmodule
