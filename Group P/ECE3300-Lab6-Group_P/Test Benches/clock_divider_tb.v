`timescale 1ns / 1ps

module tb_clock_divider;

    // Inputs
    reg base_clk;
    reg reset_n;
    reg [4:0] sel;

    // Outputs
    wire clk_div;
    wire [31:0] tick_bits;

    // Instantiate the clock_divider module
    clock_divider uut (
        .base_clk(base_clk),
        .reset_n(reset_n),
        .sel(sel),
        .clk_div(clk_div),
        .tick_bits(tick_bits)
    );

    // Clock generation (10 ns period -> 100 MHz)
    initial base_clk = 0;
    always #5 base_clk = ~base_clk;

    // Stimulus
    initial begin
        // Initialize inputs
        reset_n = 0;
        sel = 0;

        // Apply reset
        #20;
        reset_n = 1;

        // Let counter run for a while
        #100;

        // Change sel values to observe different clk_div outputs
        sel = 1; #100;
        sel = 2; #100;
        sel = 3; #100;
        sel = 4; #100;
        sel = 5; #100;

        // End simulation
        $finish;
    end
    
endmodule
