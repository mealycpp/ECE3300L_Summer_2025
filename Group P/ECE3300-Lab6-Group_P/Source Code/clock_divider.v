`timescale 1ns / 1ps
module clock_divider(
    input wire base_clk,                // Input clock
    input wire reset_n,                 // Active-low reset signal
    input wire [4:0] sel,               // SW[4:0] selects which bit of counter to output
    output wire clk_div,                // single divided clock output
    output reg [31:0] tick_bits         // full counter output (optional)
);

    // 32-bit counter increments on every base_clk rising edge
    always @(posedge base_clk or negedge reset_n) begin
        if (!reset_n)
            tick_bits <= 32'b0;         // Reset counter to zero
        else
            tick_bits <= tick_bits + 1; // Increment counter on each clock cycle
    end

    // 32x1 mux to select 1 bit from the counter
    assign clk_div = tick_bits[sel];
endmodule
