`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:49:16 AM
// Design Name: 
// Module Name: alu_tb
// Project Name: alu_tb
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

module alu_tb (
    input [3:0] A,  // Units BCD
    input [3:0] B,  // Tens BCD
    input [1:0] ctrl, // 00 = add, 01 = sub
    output reg [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;
            2'b01: result = A - B;
            default: result = 0;
        endcase
    end
endmodule
