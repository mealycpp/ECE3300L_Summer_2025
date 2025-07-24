`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:49:16 AM
// Design Name: 
// Module Name: alu_tb
// Project Name: alu_tb
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

module alu_tb (
  reg [3:0] A, B,
  reg [1:0] ctrl,
  wire [7:0] result,
);

  alu uut (
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .result(result)
  );

  initial begin
    A = 4'd6; B = 4'd3; ctrl = 2'b00; #10;
    A = 4'd6; B = 4'd3; ctrl = 2'b01; #10;
    A = 4'd3; B = 4'd6; ctrl = 2'b01; #10;
    ctrl = 2'b10; #10;
    $stop;
  end
endmodule
