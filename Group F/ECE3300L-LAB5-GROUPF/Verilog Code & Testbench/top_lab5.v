`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:06:20 AM
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
    input BTN0,        // BTN0: reset button
    input BTN1,        // BTN1: direction button
    input [4:0] SW,    // SW[4:0]: speed select
    output [1:0] AN,   // 7-seg anodes
    output [6:0] SEG,  // 7-seg segments
    output [4:0] LED,  // Debug LEDS for SW[4:0]
    output [7:0] LED_BCD // BCD display
);

    wire [31:0] cnt;
    wire clk_mux;
    reg clk_div = 0;
    wire rst_n;
    wire [3:0] digit0, digit1;

    assign rst_n = ~BTN0; // Invert BTN0 so reset is active-low

    clock_divider div(.CLK(CLK), .cnt(cnt));
    mux32x1 mux(.cnt(cnt), .sel(SW), .clk_out(clk_mux));

    // Register the mux output to make a stable divided clock
    always @(posedge CLK) begin
        clk_div <= clk_mux;
    end

    bcd_up_down_counter counter(
        .clk_div(clk_div),
        .rst_n(rst_n),
        .dir(BTN1),
        .digit0(digit0),
        .digit1(digit1)
    );

    seg7_scan display(
        .CLK(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .AN(AN),
        .SEG(SEG)
    );

    assign LED = SW;
    assign LED_BCD = {digit1, digit0};
endmodule
