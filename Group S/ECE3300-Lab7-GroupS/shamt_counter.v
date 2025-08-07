`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:30:25 PM
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
    input CLK,
    input BTNC,
    output reg [1:0] shamt_upper
);
    reg btnc_last = 0;
    always @(posedge CLK) begin
        btnc_last <= BTNC;
        if (BTNC & ~btnc_last)
            shamt_upper <= shamt_upper + 1;
    end
endmodule