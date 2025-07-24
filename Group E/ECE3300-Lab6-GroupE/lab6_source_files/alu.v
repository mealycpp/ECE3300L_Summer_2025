`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:20:20 AM
// Design Name: 
// Module Name: alu
// Project Name: alu
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

module alu(
    input [3:0] A, B,      
    input [1:0] ctrl,      
    output reg [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;         // Add
            2'b01: result = A - B;         // Subtract (wraps underflow)
            default: result = 8'd0;
        endcase
    end
endmodule
