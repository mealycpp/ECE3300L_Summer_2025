`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 06:48:27 PM
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
    input wire clk,         // 2hz clk
    input wire rst_n,       // active-low reset
    input wire btnc_clean,  // already debounced BTNC input
    output reg [1:0] shamt_upper  // output: shamt[3:2]
);

   always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shamt_upper <= 2'b00;
    end else begin
        if (btnc_clean) begin
            shamt_upper <= shamt_upper + 1'b1;
            end
        end
    end

endmodule
