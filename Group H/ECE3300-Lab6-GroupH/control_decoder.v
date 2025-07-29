`timescale 1ns / 1ps

module control_decoder(
    input [3:0] controlSW, 
    output reg [3:0] ctrl_nibble
    );
    
    always@(*) begin
        ctrl_nibble = controlSW; 
    end
    
endmodule


