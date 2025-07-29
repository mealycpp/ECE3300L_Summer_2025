`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:14:02 PM
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
    output wire [6:0] SEG,
    output wire [7:0] AN,
    output wire [7:0] LED    
);
    
       wire rst_n = ~BTN0; // Active-low reset, BTN0 pressed = reset active
    wire clk_div;
    wire [31:0] count;
    wire [3:0] units_BCD, tens_BCD;
    wire [7:0] result;
    wire [3:0] ctrl_nibble;

    // Clock Divider
    clock_divider clkdiv_inst (
        .clk(clk),
        .sel(SW[4:0]),
        .rst_n(rst_n),
        .clk_div(clk_div),
        .cnt(count)
    );

    // BCD Counters
    bcd_counter units (
        .clk(clk_div),
        .rst_n(rst_n),
        .dir_bit(SW[7]),
        .bcd_out(units_BCD)
    );

    bcd_counter tens (
        .clk(clk_div),
        .rst_n(rst_n),
        .dir_bit(SW[8]),
        .bcd_out(tens_BCD)
    );

    // ALU
    alu alu_inst (
        .A(units_BCD),
        .B(tens_BCD),
        .ctrl(SW[6:5]),
        .result(result)
    );

    // Control Decoder
    control_decoder decoder (
        .switches(SW[8:5]),
        .ctrl_nibble(ctrl_nibble)
    );

    // 7-Segment Scanner
    seg7_scan display (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(result[3:0]),
        .digit1(result[7:4]),
        .digit2(ctrl_nibble),
        .AN(AN),
        .SEG(SEG)
    );

    // LED debug output
    assign LED = result;

endmodule