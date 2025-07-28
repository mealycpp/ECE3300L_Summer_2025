`timescale 1ns / 1ps

module control_decoder(
                        input wire [3:0] ctrl_in,         // {SW8, SW7, SW6, SW5}
                        output wire [3:0] ctrl_out    // For 7-segment display
                       );
                       
                       assign ctrl_out = ctrl_in;
endmodule
