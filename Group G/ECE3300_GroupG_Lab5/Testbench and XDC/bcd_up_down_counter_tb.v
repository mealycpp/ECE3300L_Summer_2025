`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:40:44 PM
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


module bcd_up_down_counter_tb();
    reg clk_div = 0;
    reg rst_n = 0;
    reg dir = 1;
    wire [3:0] digit0, digit1;

    bcd_up_down_counter uut (
        .clk_div(clk_div),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(digit0),
        .digit1(digit1)
    );

    // Simulate clock
    always #10 clk_div = ~clk_div;

    initial begin
        $display("Testing BCD Up/Down Counter");

        // Reset
        #5 rst_n = 0;
        #20 rst_n = 1;

        // Count Up
        dir = 1;
        #200;

        // Count Down
        dir = 0;
        #200;

        $stop;
    end
endmodule

