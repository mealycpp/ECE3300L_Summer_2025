`timescale 1ns / 1ps


module control_decoder(
    input [3:0] sw,       // {SW8, SW7, SW6, SW5}
    output [3:0] ctrl_nibble
    );
    
    assign ctrl_nibble = sw;
endmodule
