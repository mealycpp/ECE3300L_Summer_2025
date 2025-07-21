`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 03:53:21 PM
// Design Name: 
// Module Name: top_lab5
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


module top_lab5(
    input CLK,
    input [4:0] SW,
    input [1:0] BTN,
    output [7:0] AN,
    output [6:0] SEG,
    output [12:0] LED
);

    wire [31:0] cnt;
    wire clk_out;
    wire [3:0] digit0, digit1;

    assign rst_n = ~BTN[0];

    // Instantiate clock divider
    clock_divider cd (
        .clk(CLK),
        .cnt(cnt)
    );

    // Instantiate Mux
    mux32x1 mux (
        .cnt(cnt),
        .sel(SW),
        .clk_out(clk_out)
    );

    // Instantiate BCD counter
    bcd_up_down_counter bcd (
        .clk_out(clk_out),
        .rst_n(rst_n),
        .dir(BTN[1]),
        .digit0(digit0),
        .digit1(digit1)
    );

    // Instantiate 7-segment scan
    seg7_scan scan (
        .clk(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .AN(AN),
        .SEG(SEG)
    );

    assign LED[4:0] = SW;
    assign LED[8:5] = digit0;
    assign LED[12:9] = digit1;

endmodule
