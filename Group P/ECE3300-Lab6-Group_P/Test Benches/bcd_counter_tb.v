`timescale 1ns / 1ps

module tb_bcd_counter;

    // Inputs
    reg clk_div;
    reg reset_n;
    reg count_up;

    // Output
    wire [3:0] bcd_out;

    // Instantiate the Unit Under Test (UUT)
    bcd_counter uut (
        .clk_div(clk_div),
        .reset_n(reset_n),
        .count_up(count_up),
        .bcd_out(bcd_out)
    );

    // Clock generation (10 ns period)
    initial clk_div = 0;
    always #5 clk_div = ~clk_div;

    // Stimulus
    initial begin
        // Initialize inputs
        reset_n = 0;
        count_up = 1;

        // Apply reset
        #15;
        reset_n = 1;

        // Count up from 0 to 9 and wrap around to 0
        count_up = 1;
        #200;

        // Count down from current value (should be 0) to 9 and down to 0 again
        count_up = 0;
        #200;

        // Assert reset in the middle of counting
        reset_n = 0;
        #10;
        reset_n = 1;
        #100;

        $finish;
    end

endmodule
