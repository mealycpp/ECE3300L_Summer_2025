`timescale 1ns / 1ps

module control_decoder_tb;
  reg [3:0] ctrl_in;
  wire [3:0] ctrl_nibble;

  control_decoder uut (
    .nibble(ctrl_in),
    .ctrl_nibble(ctrl_nibble)
  );

  initial begin
    ctrl_in = 4'b0000; #10;
    ctrl_in = 4'b1010; #10;
    ctrl_in = 4'b1111; #10;
    $stop;
  end
endmodule
