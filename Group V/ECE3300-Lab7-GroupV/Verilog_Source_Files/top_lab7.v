`timescale 1ns / 1ps

module top_lab7(
    input clk,
    input rst_n,
    input [15:0] sw,
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
    output [7:0] led,
    output [6:0] seg,
    output [7:0] an
);
    wire clk_1kHz, clk_demo;
    wire dir, rot, shamt1, shamt0;
    wire [1:0] shamt_high;
    wire [3:0] shamt;
    wire [15:0] result_word;

    // Clock divider
    clock_divider_fixed u_clk_div(
        .clk(clk), .rst_n(rst_n),
        .clk_scan(clk_1kHz), .clk_demo(clk_demo)
    );

    // Debounce toggle buttons
    debounce_toggle u_dir(.clk_1kHz(clk_1kHz), .btn_raw(btnU), .btn_toggle(dir));
    debounce_toggle u_rot(.clk_1kHz(clk_1kHz), .btn_raw(btnD), .btn_toggle(rot));
    debounce_toggle u_s1(.clk_1kHz(clk_1kHz), .btn_raw(btnL), .btn_toggle(shamt1));
    debounce_toggle u_s0(.clk_1kHz(clk_1kHz), .btn_raw(btnR), .btn_toggle(shamt0));

    assign shamt[1:0] = {shamt1, shamt0};
    // SHAMT[1:0] for lower two bits and are manual toggles
    // SHAMT[3:2] counter for the upper two bits for shifting based off center button press
    shamt_counter u_shamt_count(
        .clk(clk_demo), .rst_n(rst_n), .inc(btnC), .shamt_high(shamt_high)
    );

    assign shamt[3:2] = shamt_high;

    // Barrel shifter
    barrel_shifter16 u_shift(
        .data_in(sw), .shamt(shamt), .dir(dir), .rotate(rot), .data_out(result_word)
    );

    // Hex to 7-seg and scanner (reuse your hex_to_7seg and seg7_scan8)
    wire [3:0] nib0 = result_word[3:0];
    wire [3:0] nib1 = result_word[7:4];
    wire [3:0] nib2 = result_word[11:8];
    wire [3:0] nib3 = result_word[15:12];

    seg7_scan8 u_scan(
        .clk(clk), .rst_n(rst_n), .clk_1kHz(clk_1kHz),
        .dig0(nib0), .dig1(nib1), .dig2(nib2), .dig3(nib3),
        .an(an), .seg(seg)
    );

    // LED debug output: {DIR, ROT, SHAMT[3:0]}
    assign led = {dir, rot, shamt};

endmodule