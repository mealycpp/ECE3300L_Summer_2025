`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 04:49:50 PM
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
    input wire CLK,
    input wire [4:0] SW, //Select
    input wire [1:0] ALU,
    input wire rst, // reset 
    input wire dir0, // dir0
    input wire dir1, // dir1
    input wire DP,
    output wire [6:0] seg,
    output wire [7:0] an,
    output wire [7:0] LED
);

    wire rst_n = ~rst;

    wire [31:0] cnt;
    wire clk_out;
    wire [3:0] value0, value1;
    wire [7:0] result;
    wire [3:0] result_units, result_tens;

    wire [3:0] ControlNibble;

    assign DP = 0;
    assign LED[3:0] = value0;
    assign LED[7:4] = value1; 
    
   control_decoder DC(
        .Sw4(ALU[0]),
        .Sw3(ALU[1]),
        .Sw2(dir0),
        .Sw1(dir1),
        .ctrl_nibble(ControlNibble)
    );

    clock_divider u_clkdiv (
        .clk(CLK),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    mux32x1 u_mux (
        .cnt(cnt),
        .sel(SW),
        .clk_out(clk_out)
    );

    bcd_up_down_counter BCD0_COUNTER (
        .clk_processed(clk_out),
        .rst_n(rst_n),
        .dir(dir0),
        .digit(value0)
    );

    bcd_up_down_counter BCD1_COUNTER (
        .clk_processed(clk_out),
        .rst_n(rst_n),
        .dir(dir1),
        .digit(value1)
    );
    
    binary_to_bcd u_bcd (
        .binary(result),
        .units(result_units),
        .tens(result_tens)
    );
    
    seg7_scan u_seg (
        .clk(CLK),
        .rst_n(rst_n),
        .onesPlace(result_units),
        .tensPlace(result_tens),
        .digitCtrl(ControlNibble),
        .SEG(seg),
        .AN(an)
    );

    alu ADDSUB(
        .A(value0),
        .B(value1),
        .ctrl(ALU),
        .out(result) 
    );

endmodule
