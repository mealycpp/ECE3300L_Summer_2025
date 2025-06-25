`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 03:32:52 PM
// Design Name: 
// Module Name: decoder4to16_behave
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


module decoder4to16_behave(
    input [3:0] SW,
    input en,
    output reg [15:0] LED
    );
    
    always @(*) begin
    LED = 16'b0;
    if (en) begin
        case (SW)
        4'b0000: LED = 16'b0000_0000_0000_0001; //4x16 truth table
        4'b0001: LED = 16'b0000_0000_0000_0010;
        4'b0010: LED = 16'b0000_0000_0000_0100;
        4'b0011: LED = 16'b0000_0000_0000_1000;
        4'b0100: LED = 16'b0000_0000_0001_0000;
        4'b0101: LED = 16'b0000_0000_0010_0000;
        4'b0110: LED = 16'b0000_0000_0100_0000;
        4'b0111: LED = 16'b0000_0000_1000_0000;
        4'b1000: LED = 16'b0000_0001_0000_0000;
        4'b1001: LED = 16'b0000_0010_0000_0000;
        4'b1010: LED = 16'b0000_0100_0000_0000;
        4'b1011: LED = 16'b0000_1000_0000_0000;
        4'b1100: LED = 16'b0001_0000_0000_0000;
        4'b1101: LED = 16'b0010_0000_0000_0000;
        4'b1110: LED = 16'b0100_0000_0000_0000;
        4'b1111: LED = 16'b1000_0000_0000_0000;
        endcase
        end
        end
        
endmodule
