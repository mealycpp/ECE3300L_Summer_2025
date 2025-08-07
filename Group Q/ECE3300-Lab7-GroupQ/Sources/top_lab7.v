`timescale 1ns / 1ps

module top_lab7(
    input wire clk,
    input wire rst,
    input wire [15:0] SW,
    input wire BTNC, BTNU, BTND, BTNL, BTNR,
    output wire [7:0] AN,
    output wire [6:0] SEG,
    output wire [7:0] LED
);
    // Clock dividers
    wire clk_2khz, clk_1khz;
    clock_divider_fixed clkdiv(.clk(clk), .clk_2khz(clk_2khz), .clk_1khz(clk_1khz));

    // Debounce buttons to toggles
    wire dir, rot, sh0, sh1;
    debounce_toggle d0(.clk_1khz(clk_1khz), .btn_raw(BTNU), .btn_toggle(dir));
    debounce_toggle d1(.clk_1khz(clk_1khz), .btn_raw(BTND), .btn_toggle(rot));
    debounce_toggle d2(.clk_1khz(clk_1khz), .btn_raw(BTNL), .btn_toggle(sh1));
    debounce_toggle d3(.clk_1khz(clk_1khz), .btn_raw(BTNR), .btn_toggle(sh0));

    // Shift amount counter high bits
    wire [1:0] shamt_hi;
    shamt_counter sc(.clk(clk), .BTNC(BTNC), .shamt_hi(shamt_hi));

    wire [3:0] shamt = {shamt_hi, sh1, sh0};

    // Barrel shifter
    wire [15:0] shifted;
    barrel_shifter16 bs(.data_in(SW), .shamt(shamt), .dir(dir), .rotate(rot), .data_out(shifted));

    // 7-seg display
    wire [6:0] seg0, seg1, seg2, seg3;
    hex_to_7seg h0(.HEX(shifted[3:0]), .SEG(seg0));
    hex_to_7seg h1(.HEX(shifted[7:4]), .SEG(seg1));
    hex_to_7seg h2(.HEX(shifted[11:8]), .SEG(seg2));
    hex_to_7seg h3(.HEX(shifted[15:12]), .SEG(seg3));
    
      wire [6:0] blank = 7'b1111111;
      seg7_scan8 scanner(
        .clk_1khz(clk_1khz),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3),
        .seg4(blank),
        .seg5(blank),
        .seg6(blank),
        .seg7(blank),
        .AN(AN),
        .SEG(SEG)
                                  );

    assign LED[3:0] = shamt;
    assign LED[4] = dir;
    assign LED[5] = rot;
    assign LED[7:6] = 2'b00;
    
endmodule
