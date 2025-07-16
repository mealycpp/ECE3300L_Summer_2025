`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 12:20:01 PM
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

    reg clk_div;
    reg rst_n;
    reg dir;
    wire [3:0] digit0, digit1;

    // Instantiate the device under test (DUT)
    bcd_up_down_counter dut (
        .clk_div(clk_div),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(digit0),
        .digit1(digit1)
    );

    // Generate a clock with 10ns period (100 MHz)
    initial begin
        clk_div = 0;
        forever #5 clk_div = ~clk_div;  // 10ns period
    end

    initial begin
        // Initialize signals
        rst_n = 0;    // Assert reset (active low)
        dir = 1;      // Start counting up

        // Hold reset for a few clock cycles
        #20;
        rst_n = 1;    // Release reset, start counting up

        // Let the counter count up for 200 clock cycles
        #(200 * 10);

        // Change direction to count down
        dir = 0;

        // Let the counter count down for 200 clock cycles
        #(200 * 10);

        // Assert reset again to verify reset behavior
        rst_n = 0;
        #20;
        rst_n = 1;

        // Let the counter count up again for 100 clock cycles
        dir = 1;
        #(100 * 10);

        $stop; // End simulation
    end

endmodule


