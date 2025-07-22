`timescale 1ns / 1ps

module bcd_digit_tb;

    // Inputs
    reg clk;
    reg enable;
    reg dir;
    reg rst_n;

    // Outputs
    wire [3:0] value;
    wire       roll_out;

    // Instantiate the Unit Under Test (UUT)
    bcd_digit uut (
        .clk(clk),
        .enable(enable),
        .dir(dir),
        .rst_n(rst_n),
        .value(value),
        .roll_out(roll_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $display("Starting bcd_digit_tb...");
        $monitor("Time = %0t | rst_n=%b, enable=%b, dir=%b | value=%d, roll_out=%b", $time, rst_n, enable, dir, value, roll_out);

        // 1. Test reset
        rst_n = 0;
        enable = 0;
        dir = 1;
        #20;
        rst_n = 1;
        #10;

        // 2. Test counting up from 0 to 9 and rollover with pulsed enable
        $display("\nTesting count up and rollover...");
        enable = 1;
        dir = 1;
        repeat (12) begin
            @(posedge clk);
        end
        
        // 3. Test counting down from 2 to 0 and rollover
        $display("\nTesting count down and rollover...");
        // After counting up 12 times from 0, the value will be 2.
        enable = 1;
        dir = 0;
        repeat (5) begin
            @(posedge clk);
        end

        // 4. Test disable
        $display("\nTesting enable signal (should not count)...");
        enable = 0;
        repeat(5) @(posedge clk); // Wait for 5 clock cycles, value should not change

        $display("Finished bcd_digit_tb.");
        $stop;
    end

endmodule