`timescale 1ns / 1ps

module top_lab7(
    input wire CLK,
    input wire [15:0] SW,
    input wire [4:0] BTN,
    output wire [7:0] LED,
    output wire [6:0] SEG,
    output wire [7:0] AN
);

    wire clk1k, clk_2Hz;
    clock_divider_fixed clkdiv_inst (
        .clk(CLK),
        .clk_1kHz(clk1k),
        .clk_2Hz(clk_2Hz)
    );

    wire dir_toggle, rot_toggle, shamt0_toggle, shamt1_toggle;
    debounce_toggle db_dir (.clk1k(clk1k), .btn_raw(BTN[0]), .btn_toggle(dir_toggle));
    debounce_toggle db_rot (.clk1k(clk1k), .btn_raw(BTN[1]), .btn_toggle(rot_toggle));
    debounce_toggle db_sh0 (.clk1k(clk1k), .btn_raw(BTN[2]), .btn_toggle(shamt0_toggle));
    debounce_toggle db_sh1 (.clk1k(clk1k), .btn_raw(BTN[3]), .btn_toggle(shamt1_toggle));

    wire tick;
    debounce_tick db_btnc (.clk1k(clk1k), .btn_raw(BTN[4]), .tick(tick));

    wire [1:0] shamt_high_bits;
    shamt_counter shamt_ctr_inst (
        .clk1k(clk1k),
        .tick(tick),
        .shamt_high(shamt_high_bits)
    );

    wire [3:0] shamt = {shamt_high_bits, shamt1_toggle, shamt0_toggle};

    wire [15:0] shifted_output;
    barrel_shifter16 shifter_inst (
        .data_in(SW),
        .shamt(shamt),
        .dir(dir_toggle),
        .rotate(rot_toggle),
        .data_out(shifted_output)
    );

    assign LED = {
        shamt_high_bits,
        rot_toggle,
        dir_toggle,
        shamt1_toggle,
        shamt0_toggle,
        2'b00
    };

    wire [6:0] seg3, seg2, seg1, seg0;
    hex_to_7seg hex3 (.hex(shifted_output[15:12]), .seg(seg3));
    hex_to_7seg hex2 (.hex(shifted_output[11:8]),  .seg(seg2));
    hex_to_7seg hex1 (.hex(shifted_output[7:4]),   .seg(seg1));
    hex_to_7seg hex0 (.hex(shifted_output[3:0]),   .seg(seg0));

    wire [55:0] seg_data = {
        7'h7F, 7'h7F, 7'h7F, 7'h7F,
        seg3, seg2, seg1, seg0
    };

    seg7_scan8 scanner_inst (
        .clk(clk1k),
        .seg_data(seg_data),
        .an(AN),
        .seg(SEG)
    );

endmodule