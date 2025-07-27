`timescale 1ns / 1ps

module control_decoder (
    input  wire [3:0] ctrl_in,
    output wire [3:0] ctrl_out
);
    assign ctrl_out = ctrl_in;
endmodule
