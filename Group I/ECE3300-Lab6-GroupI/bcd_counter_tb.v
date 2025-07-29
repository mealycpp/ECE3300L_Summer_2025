`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:58:10 PM
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:58:10 PM
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

    // Inputs
    reg clk;
    reg rst_n;
    reg dir_bit;

    // Output
    wire [3:0] bcd_out;

    // Instantiate the Unit Under Test (UUT)
    bcd_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .dir_bit(dir_bit),
        .bcd_out(bcd_out)
    );

    // Clock generation: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Time\tReset\tDir\tBCD_Out");
        $monitor("%dns\t%b\t%b\t%d", $time, rst_n, dir_bit, bcd_out);

        // Initial state
        rst_n = 0;
        dir_bit = 1;  // Counting up
        #20;

        // Release reset
        rst_n = 1;

        // Count up
        #200;

        // Change direction to down
        dir_bit = 0;

        // Count down
        #200;

        // End simulation
        $finish;
    end

endmodule

