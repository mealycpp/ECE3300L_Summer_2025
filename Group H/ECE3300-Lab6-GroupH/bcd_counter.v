`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: bcd_counter
// Description: A 4-bit BCD (0-9) counter that can count up or down.
//              - dir = 1: counts up (0, 1, ..., 9, 0)
//              - dir = 0: counts down (0, 9, ..., 1, 0)
//////////////////////////////////////////////////////////////////////////////////

module bcd_counter(
    input clk,          // Input clock (from clock_divider)
    input rst_n,        // Active-low asynchronous reset (from BTNO)
    input dir,          // Direction control (1=up, 0=down)
    output reg [3:0] bcd_out // 4-bit BCD output
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bcd_out <= 4'd0; // Reset counter to 0 [cite: 52]
        end
        else begin
            if (dir) begin // Count up
                if (bcd_out == 4'd9)
                    bcd_out <= 4'd0;
                else
                    bcd_out <= bcd_out + 1;
            end
            else begin // Count down
                if (bcd_out == 4'd0)
                    bcd_out <= 4'd9;
                else
                    bcd_out <= bcd_out - 1;
            end
        end
    end

endmodule