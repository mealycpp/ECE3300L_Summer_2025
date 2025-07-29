`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 10:35:13 PM
// Design Name: 
// Module Name: seg7_scan_tb
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


module seg7_scan_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg [3:0] digit0, digit1, digit2;

    // Outputs
    wire [6:0] SEG;
    wire [7:0] AN;

    // Instantiate the module under test
    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .SEG(SEG),
        .AN(AN)
    );

    // Clock generation: 10ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tSEL\tAN\t\tSEG");

        // Apply reset
        rst_n = 0;
        digit0 = 4'd0;
        digit1 = 4'd1;
        digit2 = 4'd2;
        #20;

        // Release reset
        rst_n = 1;

        // Run long enough to see cycling behavior
        #100000;

        $finish;
    end

endmodule
