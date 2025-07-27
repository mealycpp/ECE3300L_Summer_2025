`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: top_lab6 (Updated)
// Description: Top-level module updated to use the simplified clock divider.
//////////////////////////////////////////////////////////////////////////////////

module top_lab6 (
    input  wire       CLK,
    input  wire       BTN0,
    input  wire [8:0] SW,
    output wire [6:0] SEG,
    output wire [2:0] AN,
    output wire [7:0] LED
);
    // Global active-low reset from active-high button
    wire rst_n = ~BTN0;

    // Clock divider path
    wire clk_div;
    clock_divider clock_divider_inst (
        .clk(CLK),
        .rst_n(rst_n),
        .sel(SW[4:0]),
        .clk_div(clk_div)
    );

    // BCD up/down counters (units & tens)
    wire [3:0] units, tens;
    bcd_counter units_counter_inst (.clk(clk_div), .rst_n(rst_n), .dir(SW[7]), .bcd(units));
    bcd_counter tens_counter_inst  (.clk(clk_div), .rst_n(rst_n), .dir(SW[8]), .bcd(tens));

    // ALU - add / subtract
    wire [7:0] result;
    alu alu_inst (.A(units), .B(tens), .ctrl(SW[6:5]), .result(result));

    // Control nibble to display on digit 2
    wire [3:0] ctrl_nibble;
    control_decoder control_decoder_inst (.ctrl_in(SW[8:5]), .ctrl_out(ctrl_nibble));

    // 7-segment display driver
    seg7_scan seg7_scan_inst (
        .clk    (CLK),
        .rst_n  (rst_n),
        .digit0 (result[3:0]),
        .digit1 (result[7:4]),
        .digit2 (ctrl_nibble),
        .seg    (SEG),
        .an     (AN)
    );

    // LEDs show raw counter values for debug
    assign LED[3:0] = units;
    assign LED[7:4] = tens;
endmodule