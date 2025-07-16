`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:15:27 AM
// Design Name: 
// Module Name: bcd_up_down_counter
// Project Name: bcd_up_down_counter
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
    input clk,              
    input rst_n,            
    input dir,               // Direction: 1 = Up, 0 = Down
    output reg [3:0] digit0, // Ones digit
    output reg [3:0] digit1  // Tens digit
);

    reg [3:0] next_digit0, next_digit1;
    reg carry;  // carry or borrow digit flag

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digit0 <= 0;
            digit1 <= 0;
        end else begin
            digit0 <= next_digit0;
            digit1 <= next_digit1;
        end
    end

    always @(*) begin
        next_digit0 = digit0;
        next_digit1 = digit1;
        carry = 0;

        if (dir) begin
            // Count Up
            if (digit0 == 9) begin
                next_digit0 = 0;
                if (digit1 == 9)
                    next_digit1 = 0;
                else
                    next_digit1 = digit1 + 1;
            end else begin
                next_digit0 = digit0 + 1;
            end
        end else begin
            // Count Down
            if (digit0 == 0) begin
                next_digit0 = 9;
                if (digit1 == 0)
                    next_digit1 = 9;
                else
                    next_digit1 = digit1 - 1;
            end else begin
                next_digit0 = digit0 - 1;
            end
        end
    end
endmodule
