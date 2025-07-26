`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:29:53 PM
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
    output wire [6:0] SEG
    );
    
    wire one_hz_clk;            // 1Hz clock from the divider
    wire [3:0] units_BCD;       // Units digit from the BCD counter
    wire [3:0] tens_BCD;        // Tens digit from the BCD counter
    wire [7:0] alu_result;      // 8-bit result from the ALU
    wire [3:0] ctrl_nibble_out; // 4-bit output from the control decoder

    clock_divider clk_div_inst (
        .clk(clk),
        .BTN0(BTN0),
        .clk_out(one_hz_clk)
    );

    bcd_counter bcd_count_inst (
        .clk(clk),
        .BTN0(BTN0),
        .enable(one_hz_clk),
        .units(units_BCD),
        .tens(tens_BCD)
    );

    alu alu_inst (
        .A(units_BCD),
        .B(tens_BCD),
        .ctrl(SW[6:5]),
        .result(alu_result)
    );

    control_decoder ctrl_dec_inst (
        .nibble(SW[8:5]),
        .ctrl_nibble(ctrl_nibble_out)
    );

    seg7_scan seg7_scan_inst (
        .clk(clk),
        .BTN0(BTN0),
        .result(alu_result),
        .ctrl_nibble(ctrl_nibble_out),
        .AN(AN),
        .SEG(SEG)
    );
endmodule
