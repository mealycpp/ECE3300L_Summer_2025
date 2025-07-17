`timescale 1ns / 1ps
module bcd_digit_counter(
    input wire clk,
    input wire enable,
    input wire dir,
    input wire rst_n,
    output reg [3:0] digit,
    output reg rollover
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digit <= 4'd0;
            rollover <= 1'b0;
        end else begin
            rollover <= 1'b0;
            if (enable) begin
                if (dir) begin
                    if (digit == 4'd9) begin
                        digit <= 4'd0;
                        rollover <= 1'b1;
                    end else begin
                        digit <= digit + 1;
                    end
                end else begin
                    if (digit == 4'd0) begin
                        digit <= 4'd9;
                        rollover <= 1'b1;
                    end else begin
                        digit <= digit - 1;
                    end
                end
            end
        end
    end
endmodule
