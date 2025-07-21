`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 07:43:18 PM
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


`timescale 1ns / 1ps

module clock_divider_tb;

    // Testbench signals
    reg clk;
    wire [31:0] cnt;

    // Instantiate the module under test (MUT)
    clock_divider uut (
        .clk(clk),
        .cnt(cnt)
    );

    // Generate clock: 10ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor output
    initial begin
        $display("Time (ns)\tclk\tcnt");
        $monitor("%t\t%b\t%0d", $time, clk, cnt);
    end

    // Stop simulation after some time
    initial begin
        #100 $finish;  // Run for 100ns
    end

endmodule
