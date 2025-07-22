`timescale 1ns / 1ps

module bcd_digit_counter(
    input wire clk,         // Clock input
    input wire enable,      // Enable signal to allow counting
    input wire dir,         // Direction: 1 = up, 0 = down
    input wire rst_n,       // Active-low reset
    output reg [3:0] digit, // 4-bit output representing BCD digit (0-9)
    output reg rollover     // Indicates overflow (up) or underflow (down)
);

    // Sequential logic: triggered on rising clock or falling reset
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset case: digit and rollover are cleared
            digit <= 4'd0;
            rollover <= 1'b0;
        end else begin
            rollover <= 1'b0;  // Default: no rollover unless a boundary is hit

            if (enable) begin  // Only count when enabled
                if (dir) begin  // Count up
                    if (digit == 4'd9) begin
                        digit <= 4'd0;     // Wrap around to 0
                        rollover <= 1'b1;  // Signal rollover
                    end else begin
                        digit <= digit + 1;
                    end
                end else begin  // Count down
                    if (digit == 4'd0) begin
                        digit <= 4'd9;     // Wrap around to 9
                        rollover <= 1'b1;  // Signal underflow rollover
                    end else begin
                        digit <= digit - 1;
                    end
                end
            end
        end
    end
endmodule
