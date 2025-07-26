`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dalton Hoang
// 
// Create Date: 07/21/2025 07:12:11 PM
// Design Name: 
// Module Name: top_tb
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
//////////////////////////////////////////////////////////////////////////////////A
module top_tb();

    reg clk;
    reg rst_n;
    reg btn1;
    reg [4:0] sw;

    wire [6:0] seg;
    wire [7:0] an;
    wire [12:0] led;

    // Instantiate DUT
    top uut (
        .CLK(clk),
        .SW(sw),
        .BTN1(btn1),
        .BTN0(rst_n),
        .AN(an),
        .SEG(seg),
        .LED(led)
    );

    // Generate 100 MHz clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        rst_n = 0;
        btn1 = 0;
        sw = 5'b11111; // Fastest tick for testbench

        #100; 
        rst_n = 1;

        // Run for some time counting up
        #50000;

        // Toggle direction (simulate BTN1 press)
        btn1 = 1; #10; btn1 = 0;

        #50000;

        $stop;
    end

    // Speed up display scan for simulation ONLY
    initial begin
        force uut.u_sevenseg.scan_ctr[15] = uut.u_sevenseg.scan_ctr[3];
    end

endmodule
