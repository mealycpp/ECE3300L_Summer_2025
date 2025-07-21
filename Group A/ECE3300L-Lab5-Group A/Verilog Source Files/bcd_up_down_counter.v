`timescale 1ns / 1ps

module bcd_up_down_counter(
    input clk,              
    input rst_n,            
    input dir,
    output reg [3:0] digit0,
    output reg [3:0] digit1
);

    reg [3:0] next_digit0, next_digit1;
    reg carry;

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
