`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 05:43:44 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
input clk,
    input btn0,
    input dir,
    output reg [3:0] digit,
    output reg rollover
);
    always @(posedge clk or posedge btn0) begin
        if (btn0) begin
            digit <= 4'd0; //resets output digit to 0 on reset
            rollover <= 0;
        end else begin
            if (!dir) begin //counts up when the direction is set to 0
                if (digit == 9) begin
                    digit <= 0; //rollover protection for BCD
                    rollover <= 1;
                end else begin
                    digit <= digit + 1; //increments if less than 9
                    rollover <= 0;
                end
            end 
            else begin //counts down when the direction is set to 1
                if (digit == 0) begin 
                    digit <= 9; //rollover protection for BCD
                    rollover <= 1;
                end 
                else begin
                    digit <= digit - 1; //decrements if less than 0
                    rollover <= 0;
                end
            end
        end
    end
endmodule
