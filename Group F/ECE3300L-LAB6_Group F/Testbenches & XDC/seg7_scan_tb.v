`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:50:54 PM
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


module seg7_scan_tb(
    );
    
    reg clk; 
    reg rst_n;
    reg [3:0] digit_0 = 16'd6;
    reg [3:0] digit_1 = 16'd5;
    reg [3:0] digit_2 = 16'd7;   
    wire [6:0] SEG;
    wire [2:0] AN;

    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .digit_0(digit_0),
        .digit_1(digit_1),
        .digit_2(digit_2),
        .SEG(SEG),
        .AN(AN)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_n = 0; #20;
        rst_n = 1;
        #500;
        $finish;
    end
endmodule
