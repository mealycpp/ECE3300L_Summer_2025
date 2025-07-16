`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 12:06:22 PM
// Design Name: 
// Module Name: bcd_up_down_counter_tb
// Project Name: bcd_up_down_counter_tb
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
    reg clk = 0;
    reg rst_n;
    reg dir;
    wire [3:0] digit0, digit1;

    bcd_up_down_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(digit0),
        .digit1(digit1)
    );

    always #5 clk = ~clk; 

    initial begin
        rst_n = 0; dir = 1; #20;
        rst_n = 1; #100;

        dir = 0; #100;
        $finish;
    end
endmodule
