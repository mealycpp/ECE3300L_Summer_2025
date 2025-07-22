`timescale 1ns / 1ps                                // Specifies the time unit (1ns) and time precision (1ps) for simulation.
module clock_divider (
    input wire sys_clk,                             // Input system clock signal
    input wire reset_n,                             // Active-low asynchronous reset signal
    output reg [31:0] tick_count                    // 32-bit register output to count clock ticks
);

always @(posedge sys_clk or negedge reset_n) begin  // Always block triggered on the rising edge of sys_clk or falling edge of reset_n
    if (!reset_n)                                   // If reset_n is low (reset active), set tick_count to 0 (asynchronous reset)
        tick_count <= 0;
    else
        tick_count <= tick_count + 1;               // Otherwise, increment tick_count on each rising edge of sys_clk
end

endmodule
