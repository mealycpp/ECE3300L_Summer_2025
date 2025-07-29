`timescale 1ns / 1ps

module control_decoder_tb;
  reg [3:0] controlSW;
  wire [3:0] ctrl_nibble;

  control_decoder uut (
    .controlSW(controlSW),
    .ctrl_nibble(ctrl_nibble)
  );

  initial begin
    controlSW = 4'b0000; #10;
    controlSW = 4'b1010; #10;
    controlSW = 4'b1111; #10;
    $stop;
  end
endmodule
