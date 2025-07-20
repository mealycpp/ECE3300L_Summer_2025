`timescale 1ns / 1ps

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
            if (dir) begin  
                if (digit0 == 9) begin
                    digit0 <= 0;
                    digit1 <= (digit1 == 9) ? 0 : digit1 + 1;
                end else
                    digit0 <= digit0 + 1;
            end else begin  
                if (digit0 == 0) begin
                    digit0 <= 9;
                    digit1 <= (digit1 == 0) ? 9 : digit1 - 1;
                end else
                    digit0 <= digit0 - 1;
            end
        end
    end
endmodule