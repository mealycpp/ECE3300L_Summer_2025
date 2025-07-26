`timescale 1ns / 1ps

module control_decoder(
    input [3:0] ctrl_in,    // Input from SW[8:5]
    output [3:0] ctrl_out   // Output to the 7-seg scanner
    );

    // This module simply acts as a wire
    assign ctrl_out = ctrl_in;

endmodule