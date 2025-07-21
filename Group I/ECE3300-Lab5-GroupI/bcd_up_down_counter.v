`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 03:53:21 PM
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
    input clk_out,
    input rst_n,
    input dir, // 1 for up, 0 for down
    output reg [3:0] digit1, // tens
    output reg [3:0] digit0  // units
);
    always @(posedge clk_out or negedge rst_n) begin
        if (!rst_n) begin
            digit0 <= 0;
            digit1 <= 0;
        end else if (dir) begin
            // Count Up
            if (digit0 == 9) begin
                digit0 <= 0;
                if (digit1 == 9)
                    digit1 <= 0;
                else
                    digit1 <= digit1 + 1;
            end else begin
                digit0 <= digit0 + 1;
            end
        end else begin
            // Count Down
            if (digit0 == 0) begin
                digit0 <= 9;
                if (digit1 == 0)
                    digit1 <= 9;
                else
                    digit1 <= digit1 - 1;
            end else begin
                digit0 <= digit0 - 1;
            end
        end
    end
endmodule

