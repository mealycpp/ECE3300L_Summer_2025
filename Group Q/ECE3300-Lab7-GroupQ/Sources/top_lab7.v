`timescale 1ns / 1ps


module top_lab7(
    input clk,
    input [15:0] SW,
    input BTNC, BTNU, BTND, BTNL, BTNR,
    output [7:0] AN,
    output [6:0] SEG,
    output [7:0] LED
);
    // Clock dividers
    wire clk_1k, clk_2hz;
    clock_divider_fixed #(50000) div1(clk, clk_1k);     // ~1kHz
    clock_divider_fixed #(25000000) div2(clk, clk_2hz); // ~2Hz

    // Debounce buttons to toggles
    wire dir, rot, sh0, sh1;
    debounce_toggle d0(clk_1k, BTNU, dir);
    debounce_toggle d1(clk_1k, BTND, rot);
    debounce_toggle d2(clk_1k, BTNL, sh0);
    debounce_toggle d3(clk_1k, BTNR, sh1);

    // Shift amount counter high bits
    wire [1:0] shamt_hi;
    shamt_counter sc(.clk(clk_2hz), .rst(BTNC), .btn_inc(BTNC), .shamt_hi(shamt_hi));

    wire [3:0] shamt = {shamt_hi, sh1, sh0};

    // Barrel shifter
    wire [15:0] shifted;
    barrel_shifter16 bs(SW, shamt, dir, rot, shifted);

    // 7-seg display
    seg7_scan8 disp(clk_1k, BTNC, shifted, SEG, AN);

    assign LED = {dir, rot, shamt};
endmodule