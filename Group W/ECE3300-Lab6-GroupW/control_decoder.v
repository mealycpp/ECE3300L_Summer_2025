`timescale 1ns / 1ps

module control_decoder(
    input wire Sw4,
    input wire Sw3,
    input wire Sw2,
    input wire Sw1,
    output [3:0] ctrl_nibble
    );
    
    wire [3:0] nibble = {Sw1, Sw2, Sw3, Sw4};
    
    assign ctrl_nibble = nibble;
endmodule
