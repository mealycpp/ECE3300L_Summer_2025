`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:30:25 PM
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

    // Clock divider
    wire clk_2hz, clk_1khz;
    clock_divider_fixed clkdiv(
        .CLK(CLK),
        .CLK_2HZ(clk_2hz),
        .CLK_1KHZ(clk_1khz)
    );

    // Debounced toggles
    wire dir_toggle, rot_toggle, shamt0_toggle, shamt1_toggle;
    debounce_toggle deb_dir(.CLK_1KHZ(clk_1khz), .BTN(BTNU), .BTN_TOGGLE(dir_toggle));
    debounce_toggle deb_rot(.CLK_1KHZ(clk_1khz), .BTN(BTND), .BTN_TOGGLE(rot_toggle));
    debounce_toggle deb_shamt0(.CLK_1KHZ(clk_1khz), .BTN(BTNL), .BTN_TOGGLE(shamt0_toggle));
    debounce_toggle deb_shamt1(.CLK_1KHZ(clk_1khz), .BTN(BTNR), .BTN_TOGGLE(shamt1_toggle));

    // SHAMT[3:2] from btnc
    wire [1:0] shamt_upper;
    shamt_counter cnt(
        .CLK(clk_1khz),
        .BTNC(BTNC),
        .shamt_upper(shamt_upper)
    );

  
    wire [3:0] shamt = {shamt_upper, shamt1_toggle, shamt0_toggle};

    // Barrel shifter
    wire [15:0] barrel_out;
    barrel_shifter16 shifter(
        .data_in(SW),
        .shamt(shamt),
        .dir(dir_toggle),
        .rotate(rot_toggle),
        .data_out(barrel_out)
    );

    // hex to 7seg 
    wire [6:0] seg0, seg1, seg2, seg3;
    hex_to_7seg h0(.hex_in(barrel_out[3:0]), .SEG(seg0));
    hex_to_7seg h1(.hex_in(barrel_out[7:4]), .SEG(seg1));
    hex_to_7seg h2(.hex_in(barrel_out[11:8]), .SEG(seg2));
    hex_to_7seg h3(.hex_in(barrel_out[15:12]), .SEG(seg3));
    wire [6:0] blank = 7'b1111111;

    // scanner
    seg7_scan8 scanner(
        .CLK_1KHZ(clk_1khz),
        .SEG0(seg0), .SEG1(seg1), .SEG2(seg2), .SEG3(seg3),
        .SEG4(blank), .SEG5(blank), .SEG6(blank), .SEG7(blank),
        .AN(AN), .SEG(SEG)
    );

    // Debug LEDs
    assign LED[7:0] = {2'b00, shamt, rot_toggle, dir_toggle};

endmodule