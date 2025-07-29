`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:34:27 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [1:0] ctrl,
    output reg [7:0] result
    );
    
    always@(*) begin
        case (ctrl)
            2'b000: result = A + B;   
            2'b001: result = A - B;
            default: result = 8'd0;
       endcase
    end   
endmodule
