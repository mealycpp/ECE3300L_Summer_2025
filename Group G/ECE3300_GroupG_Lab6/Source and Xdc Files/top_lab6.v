`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:54:24 PM
// Design Name: 
// Module Name: top_lab6
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


module top_lab6(
    input wire clk,
    input wire BTN0,
    input wire [8:0] SW,
    output wire [2:0] AN,
    output wire [6:0] SEG,
    output wire [7:0] LED
    );

    wire clk_div;
    wire [3:0] units_BCD, tens_BCD;
    wire [7:0] alu_result;
    wire [3:0] ctrl_nibble;

    clock_divider clkdiv_inst (
        .clk(clk),
        .SW(SW[4:0]),
        .clk_div(clk_div)
    );

    bcd_counter units_inst (
        .clk_div(clk_div),
        .BTN0(BTN0),
        .dir_bit(SW[7]),
        .bcd_out(units_BCD)
    );

    bcd_counter tens_inst (
        .clk_div(clk_div),
        .BTN0(BTN0),
        .dir_bit(SW[8]),
        .bcd_out(tens_BCD)
    );

    alu alu_inst (
        .A(units_BCD),
        .B(tens_BCD),
        .ctrl(SW[6:5]),
        .result(alu_result)
    );

    control_decoder ctrl_inst (
        .nibble(SW[8:5]),
        .ctrl_nibble(ctrl_nibble)
    );

    seg7_scan seg_inst (
        .clk(clk),
        .BTN0(BTN0),
        .result(alu_result),
        .ctrl_nibble(ctrl_nibble),
        .AN(AN),
        .SEG(SEG)
    );

    assign LED[3:0] = units_BCD;
    assign LED[7:4] = tens_BCD;
endmodule
