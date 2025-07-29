`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:57:31 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb;
    // Inputs
    reg clk;
    reg rst_n;
    reg [4:0] sel;

    // Outputs
    wire clk_div;
    wire [31:0] cnt;

    // Instantiate the Unit Under Test (UUT)
    clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .clk_div(clk_div),
        .cnt(cnt)
    );

    // Clock generation: 100 MHz => 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle every 5ns => 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        sel = 5'd0;

        // Apply reset
        #20;
        rst_n = 1;

        // Run with sel = 0 (fastest toggle)
        #100;

        // Try a few different select values
        sel = 5'd3;  // Slower division
        #200;

        sel = 5'd5;  // Even slower
        #500;

        sel = 5'd10; // Very slow
        #1000;

        // Done
        $finish;
    end

    // Optional: Monitor output to console
    initial begin
        $display("Time\tclk\tsel\tclk_div\tcnt");
        $monitor("%g\t%b\t%d\t%b\t%h", $time, clk, sel, clk_div, cnt);
    end

endmodule