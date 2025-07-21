`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 07:45:56 PM
// Design Name: 
// Module Name: bcd_up_down_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module bcd_up_down_counter_tb;

    // Testbench signals
    reg clk_out;
    reg rst_n;
    reg dir;
    wire [3:0] digit1;
    wire [3:0] digit0;

    // Instantiate the Unit Under Test (UUT)
    bcd_up_down_counter uut (
        .clk_out(clk_out),
        .rst_n(rst_n),
        .dir(dir),
        .digit1(digit1),
        .digit0(digit0)
    );

    // Clock generation (10ns period)
    initial begin
        clk_out = 0;
        forever #5 clk_out = ~clk_out;
    end

    // Stimulus
    initial begin
        $display("Time\tReset\tDir\tTens\tUnits");
        $monitor("%dns\t%b\t%b\t%d\t%d", $time, rst_n, dir, digit1, digit0);

        // Initialize
        rst_n = 0;
        dir = 1; // Count up
        #20;
        rst_n = 1;

        // Count up to 15
        #200;

        // Change direction to down
        dir = 0;

        // Count down
        #200;

        // Finish simulation
        $finish;
    end

endmodule

