`timescale 1ns / 1ps

module control_decoder(
input [3:0]nibble,
output reg[3:0]ctrl_nibble
);
always @ (*)begin
ctrl_nibble = nibble;//decoder where input=output, no change at all
end
endmodule