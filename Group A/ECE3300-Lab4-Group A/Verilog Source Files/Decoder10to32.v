`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 03:00:26 AM
// Design Name: 
// Module Name: Decoder10to32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder10to32(
    input [9:0] SW_in,
    output reg [31:0] out
    );
    
    initial out = 32'd0;
    
    always @(*) begin
        case (SW_in[9:8])
            2'b00: out[7:0] = SW_in;
            2'b01: out[15:8] = SW_in;
            2'b10: out[23:16] = SW_in;
            2'b11: out[31:24] = SW_in;
        endcase
    end
endmodule
