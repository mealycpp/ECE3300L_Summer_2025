`timescale 1ns / 1ps
module bcd_counter(
    input wire clk_div,                                     // Clock input (typically a divided-down system clock)
    input wire reset_n,                                     // Active-low synchronous reset
    input wire count_up,                                    // Control signal: 1 for count up, 0 for count down
    output reg [3:0] bcd_out                                // 4-bit BCD counter output (0 to 9)
);

// Always block triggered on the rising edge of clk_div or falling edge of reset_n
    always @(posedge clk_div or negedge reset_n) begin
        if (!reset_n)                                       // If reset_n is low, reset the counter to 0
            bcd_out <= 0;
        else if (count_up)
            bcd_out <= (bcd_out == 9) ? 0 : bcd_out + 1;    // If count_up is high, increment counter
        else
            bcd_out <= (bcd_out == 0) ? 9 : bcd_out - 1;     // If count_up is low, decrement counter
    end
endmodule