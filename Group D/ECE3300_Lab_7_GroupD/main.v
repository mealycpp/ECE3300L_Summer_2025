//bryan

module main(
    input clk,
    input rst,
    input [15:0] sw,
    input btnU, btnD, btnL, btnR, btnC,
    output [7:0] led,
    output [6:0] seg,
    output [7:0] an
);
    wire clk_1khz, clk_demo;
    clock_divider_fixed div(.clk(clk), .clk_1khz(clk_1khz), .clk_demo(clk_demo));

    wire dir, rot, shamt0, shamt1;
    debounce_toggle d0(.clk_1khz(clk_1khz), .btn_raw(btnU), .btn_toggle(dir));
    debounce_toggle d1(.clk_1khz(clk_1khz), .btn_raw(btnD), .btn_toggle(rot));
    debounce_toggle d2(.clk_1khz(clk_1khz), .btn_raw(btnL), .btn_toggle(shamt0));
    debounce_toggle d3(.clk_1khz(clk_1khz), .btn_raw(btnR), .btn_toggle(shamt1));

    wire [1:0] shamt_high;
    shamt_counter counter(.clk(clk), .rst(rst), .btn_center(btnC), .shamt_high(shamt_high));

    wire [3:0] shamt = {shamt_high, shamt1, shamt0};

    wire [15:0] shifted;
    barrel_shifter16 bs(.data_in(sw), .shamt(shamt), .dir(dir), .rotate(rot), .data_out(shifted));

    assign led = {shamt, rot, dir};

    seg7_scan8 scan(
        .clk(clk_1khz),
        .hex0(shifted[3:0]),
        .hex1(shifted[7:4]),
        .hex2(shifted[11:8]),
        .hex3(shifted[15:12]),
        .seg(seg),
        .an(an)
    );
endmodule
