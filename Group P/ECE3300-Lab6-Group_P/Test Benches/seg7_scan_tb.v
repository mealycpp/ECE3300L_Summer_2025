`timescale 1ns / 1ps

module tb_seg7_scan;

    // Inputs
    reg clk_fast;
    reg rst_n;
    reg [3:0] lower_digit;
    reg [3:0] upper_digit;
    reg [3:0] ctrl_nibble;

    // Outputs
    wire [6:0] seg_pins;
    wire dp;
    wire [2:0] anodes;

    // Instantiate the Unit Under Test
    seg7_scan uut (
        .clk_fast(clk_fast),
        .rst_n(rst_n),
        .lower_digit(lower_digit),
        .upper_digit(upper_digit),
        .ctrl_nibble(ctrl_nibble),
        .seg_pins(seg_pins),
        .dp(dp),
        .anodes(anodes)
    );

    // Clock generation: 10 ns period => 100 MHz
    initial clk_fast = 0;
    always #5 clk_fast = ~clk_fast;

    // Stimulus
    initial begin
        // Initialize inputs
        rst_n = 0;
        lower_digit = 4'd3;
        upper_digit = 4'd1;
        ctrl_nibble = 4'd7;

        // Apply reset
        #20 rst_n = 1;

        // Hold values, observe scanning
        #2000;

        // Change inputs mid-run
        lower_digit = 4'd9;
        upper_digit = 4'd5;
        ctrl_nibble = 4'd0;

        #2000;

        // Finish simulation
        $finish;
    end

endmodule
