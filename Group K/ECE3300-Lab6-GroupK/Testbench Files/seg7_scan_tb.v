`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 07:00:07 PM
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

module tb_seg7_scan;

    reg [3:0] lower_digit;
    reg [3:0] upper_digit;
    reg [3:0] ctrl_nibble;
    reg clk;
    reg rst_n;

    wire [2:0] AN;
    wire [6:0] SEG;

    seg7_scan uut (
        .lower_digit(lower_digit),
        .upper_digit(upper_digit),
        .ctrl_nibble(ctrl_nibble),
        .clk(clk),
        .rst_n(rst_n),
        .AN(AN),
        .SEG(SEG)
    );

 
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst_n = 0;
        lower_digit = 4'd3;
        upper_digit = 4'd7;
        ctrl_nibble = 4'd12;

        // Hold reset low
        #20;
        rst_n = 1;

        // Let scan cycle run for a while
        #200000;
        
        $finish;
    end

endmodule