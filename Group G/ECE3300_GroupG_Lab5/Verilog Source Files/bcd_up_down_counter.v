`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:37:32 PM
// Design Name: 
// Module Name: bcd_up_down_counter
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


module bcd_up_down_counter(
    input clk_div,
    input rst_n,
    input dir,
    output reg [3:0] digit0 = 0,
    output reg [3:0] digit1 = 0
);
    always @(posedge clk_div or negedge rst_n) begin
        if (!rst_n) begin
            digit0 <= 0;
            digit1 <= 0;
        end else begin
            if (dir) begin  // Up
                if (digit0 == 9) begin
                    digit0 <= 0;
                    digit1 <= (digit1 == 9) ? 0 : digit1 + 1;
                end else
                    digit0 <= digit0 + 1;
            end else begin  // Down
                if (digit0 == 0) begin
                    digit0 <= 9;
                    digit1 <= (digit1 == 0) ? 9 : digit1 - 1;
                end else
                    digit0 <= digit0 - 1;
            end
        end
    end
endmodule