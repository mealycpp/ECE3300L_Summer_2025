`timescale 1ns / 1ps

module control_decoder(
    input [3:0] controlSW, // {SW8,SW7,SW6,SW5} 
    output reg [3:0] ctrl_nibble
    );
    
    always@(*)begin
        ctrl_nibble = controlSW;
    end
    
endmodule
