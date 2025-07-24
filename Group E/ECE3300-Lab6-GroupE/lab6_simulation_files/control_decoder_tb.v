`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:59:12 AM
// Design Name: 
// Module Name: control_decoder_tb
// Project Name: control_decoder_tb
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
module control_decoder_tb (
  reg [3:0] ctrl_in;
  wire [3:0] ctrl_nibble
);
  
  control_decoder uut (
    .ctrl_in(ctrl_in),
    .ctrl_nibble(ctrl_nibble)
  );

  initial begin
    ctrl_in = 4'b0000; #10;
    ctrl_in = 4'b1010; #10;
    ctrl_in = 4'b1111; #10;
    $stop;
  end
endmodule
