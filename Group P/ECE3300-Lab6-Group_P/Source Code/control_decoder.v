`timescale 1ns / 1ps
module control_decoder(
    input wire [3:0] control_switches,          // Input from switches
    output wire [3:0] ctrl_nibble               // Output nibble passed to another module
);
    assign ctrl_nibble = control_switches;
endmodule
