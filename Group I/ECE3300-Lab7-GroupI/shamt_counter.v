`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:49:41 PM
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
    input clk,
    input reset,
    input inc,
    output reg [1:0] shamt_high
);
    always @(posedge clk) begin
        if (reset)
            shamt_high <= 2'b00;
        else if (inc)
            shamt_high <= shamt_high + 1;
    end
endmodule