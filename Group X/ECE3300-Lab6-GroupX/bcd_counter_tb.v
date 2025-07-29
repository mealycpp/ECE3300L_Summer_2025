`timescale 1ns / 1ps

module bcd_counter_tb;
    reg clk_processed;
    reg rst_n;
    reg dir;
    wire [3:0] digit;

    bcd_up_down_counter uut (
        .clk_processed(clk_processed),
        .rst_n(rst_n),
        .dir(dir),
        .digit(digit)
    );

    // Generate a slow clock for visibility (100 MHz -> 10 ns period)
    initial begin
        clk_processed = 1'b0;
        forever #5 clk_processed = ~clk_processed;
    end

    // Apply reset and drive stimulus
    initial begin
        // Reset the counter
        rst_n = 1'b0;
        dir = 1'b1;  // prepare to count up
        #20;           // hold reset low for two clock cycles
        rst_n = 1'b1;

        // Count up through wrap
        repeat (12) @(posedge clk_processed);

        // Now count down through wrap
        dir = 1'b0;
        repeat (12) @(posedge clk_processed);

        $finish;
    end
endmodule
