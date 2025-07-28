`timescale 1ns / 1ps

module alu_tb;
  reg [3:0] A, B;
  reg [1:0] ctrl;
  wire [7:0] result;

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
