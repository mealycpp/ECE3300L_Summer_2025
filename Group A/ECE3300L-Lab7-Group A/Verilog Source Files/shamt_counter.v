`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
// Design Name: 
// Module Name: shamt_counter
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


module shamt_counter(
    input clk, increaseButton,
    output reg [1:0] shamt
    );
    
    initial shamt = 2'd0;
    
    always @(posedge clk) begin
        if(increaseButton) shamt <= shamt + 1;
    end
endmodule
