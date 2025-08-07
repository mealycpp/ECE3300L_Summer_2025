`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:53:39 PM
// Design Name: 
// Module Name: top_lab7
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


module top_lab7(
    input CLK,
    input [15:0] SW,
    input BTNU, BTND, BTNL, BTNR, BTNC,
    output [7:0] LED,
    output [7:0] AN,
    output [6:0] SEG
);

    wire clk_2hz, clk_1khz;
    clock_divider_fixed clkdiv(
        .CLK(CLK),
        .CLK_2HZ(clk_2hz),
        .CLK_1KHZ(clk_1khz)
    );

    wire dir_toggle, rot_toggle, shamt0_toggle, shamt1_toggle;
    debounce_toggle deb_dir(.CLK_1KHZ(clk_1khz), .BTN_RAW(BTNU), .BTN_TOGGLE(dir_toggle));
    debounce_toggle deb_rot(.CLK_1KHZ(clk_1khz), .BTN_RAW(BTND), .BTN_TOGGLE(rot_toggle));
    debounce_toggle deb_shamt0(.CLK_1KHZ(clk_1khz), .BTN_RAW(BTNL), .BTN_TOGGLE(shamt0_toggle));
    debounce_toggle deb_shamt1(.CLK_1KHZ(clk_1khz), .BTN_RAW(BTNR), .BTN_TOGGLE(shamt1_toggle));

    wire [1:0] shamt_high;
    shamt_counter cnt(
        .CLK(clk_1khz),
        .BTNC(BTNC),
        .SHAMT_HIGH(shamt_high)
    );

    wire [3:0] shamt = {shamt_high, shamt1_toggle, shamt0_toggle};

    wire [15:0] barrel_out;
    barrel_shifter16 shifter(
        .DATA_IN(SW),
        .SHAMT(shamt),
        .DIR(dir_toggle),
        .ROTATE(rot_toggle),
        .DATA_OUT(barrel_out)
    );

    wire [6:0] seg0, seg1, seg2, seg3;
    hex_to_7seg h0(.HEX(barrel_out[3:0]), .SEG(seg0));
    hex_to_7seg h1(.HEX(barrel_out[7:4]), .SEG(seg1));
    hex_to_7seg h2(.HEX(barrel_out[11:8]), .SEG(seg2));
    hex_to_7seg h3(.HEX(barrel_out[15:12]), .SEG(seg3));
    wire [6:0] blank = 7'b1111111;

    seg7_scan8 scanner(
        .CLK_1KHZ(clk_1khz),
        .SEG0(seg0), .SEG1(seg1), .SEG2(seg2), .SEG3(seg3),
        .SEG4(blank), .SEG5(blank), .SEG6(blank), .SEG7(blank),
        .AN(AN), .SEG(SEG)
    );

    assign LED[7:0] = {2'b00, shamt, rot_toggle, dir_toggle};

endmodule