`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andy Siu
// 
// Create Date: 07/28/2025 06:38:32 PM
// Design Name: 
// Module Name: bcd_counter_tb
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

module bcd_counter_tb;

    reg clk;
    reg rst_n;
    reg bit_dir;

    wire [3:0] value;

    bcd_counter uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .bit_dir(bit_dir), 
        .value(value)
    );

    always #5 clk = ~clk;

    initial begin
        $display("BCD Counter Testbench");
        $display("Time\tclk\trst_n\tbit_dir\tvalue");
        $monitor("%0t\t%b\t%b\t%b\t%0d", $time, clk, rst_n, bit_dir, value);

        clk = 0;
        rst_n = 0;
        bit_dir = 1;

        #20;
        rst_n = 1;

        // Count Up: 0 to 9 and wrap
        #200;

        // Count Down: 9 to 0 and wrap
        bit_dir = 0;
        #200;

        // Toggle bit_direction mid-count
        bit_dir = 1; #50;
        bit_dir = 0; #50;
        bit_dir = 1; #50;

        // Trigger reset mid-count
        rst_n = 0; #10;
        rst_n = 1; #100;

        $display("Test completed.");
        $finish;
    end

endmodule
