`timescale 1ns / 1ps                        // Defines the time unit as 1 nanosecond and simulation precision as 1 picosecond
module mux32x1 (
    input wire [31:0] tick_bits,            // 32-bit input signal, typically from a clock divider or counter.
    input wire [4:0] speed_select,          // 5-bit selector to choose one of the 32 tick_bits (2^5 = 32).
    output wire clk_out                     // Output clock signal selected from tick_bits
);

assign clk_out = tick_bits[speed_select];   // Assigns clk_out to the specific bit in tick_bits as determined by speed_select

endmodule
