`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Dalton Hoang
// 
// Create Date: 07/25/2025 12:55:42 AM
// Design Name: Binary Coded Decimal Counter
// Module Name: alu
// Project Name: 
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: Performs addition or subtraction based on 2, 4 bit BCD inputs and outputs 8 Bit result
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input [3:0] A, 
    input [3:0] B,      
    input [1:0] ctrl,      
    output reg [7:0] result
    );
    
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;    // Add     
            2'b01: result = A - B;    // Subtract  
            default: result = 8'b00000000;   // Default
        endcase
    end
    
endmodule