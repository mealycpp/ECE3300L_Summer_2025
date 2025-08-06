`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 11:03:27 AM
// Design Name: 
// Module Name: top_lab7
// Project Name: top_lab7
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
    input wire CLK,                 
    input wire [15:0] SW,           
    input wire [4:0] BTN,           
    output wire [7:0] LED,          
    output wire [6:0] SEG,          
    output wire [7:0] AN            
);

    wire rst_n = ~BTN[4];

    // Clock divider
    wire clk_1kHz, clk_demo;
    clock_divider_fixed clkdiv (
        .clk(CLK),
        .clk_1kHz(clk_1kHz),
        .clk_demo(clk_demo)
    );

    // Debounce and toggle push-buttons
    wire dir, rot, sham0, sham1;
    debounce_toggle db_dir (.clk_1kHz(clk_1kHz), .btn_raw(BTN[0]), .btn_toggle(dir));   // BTNU
    debounce_toggle db_rot (.clk_1kHz(clk_1kHz), .btn_raw(BTN[1]), .btn_toggle(rot));   // BTND
    debounce_toggle db_s0  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[2]), .btn_toggle(sham0)); // BTNL
    debounce_toggle db_s1  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[3]), .btn_toggle(sham1)); // BTNR

    // Debounce + edge detect for BTNC
    wire btnc_toggle, btnc_pulse;
    debounce_toggle db_btnc (
        .clk_1kHz(clk_1kHz),
        .btn_raw(BTN[4]),
        .btn_toggle(btnc_toggle)
    );
    reg btnc_prev;
    always @(posedge clk_demo) begin
        btnc_prev <= btnc_toggle;
    end
    assign btnc_pulse = btnc_toggle & ~btnc_prev;

    // SHAMT counter
    wire [1:0] shamt_high;
    shamt_counter shamtctr (
        .clk(btnc_pulse),
        .rst(~rst_n),
        .shamt_high(shamt_high)
    );

    wire [3:0] shamt = {shamt_high, sham1, sham0};

    // Barrel shifter
    wire [15:0] result;
    barrel_shifter16 shifter (
        .data_in(SW),
        .shamt(shamt),
        .dir(dir),
        .rotate(rot),
        .data_out(result)
    );

    assign LED[7:4] = shamt;
    assign LED[3] = rot;
    assign LED[2] = dir;
    assign LED[1:0] = 2'b00;

    // 7-segment encoder
    wire [6:0] digits[7:0];
    hex_to_7seg h0 (.hex(result[3:0]),   .seg(digits[0]));
    hex_to_7seg h1 (.hex(result[7:4]),   .seg(digits[1]));
    hex_to_7seg h2 (.hex(result[11:8]),  .seg(digits[2]));
    hex_to_7seg h3 (.hex(result[15:12]), .seg(digits[3]));
    assign digits[4] = 7'b1111111;
    assign digits[5] = 7'b1111111;
    assign digits[6] = 7'b1111111;
    assign digits[7] = 7'b1111111;

    // 7-segment scanner
    seg7_scan8 scanner (
        .clk_1kHz(clk_1kHz),
        .SEG0(digits[0]),
        .SEG1(digits[1]),
        .SEG2(digits[2]),
        .SEG3(digits[3]),
        .SEG4(digits[4]),
        .SEG5(digits[5]),
        .SEG6(digits[6]),
        .SEG7(digits[7]),
        .AN(AN),
        .SEG(SEG)
    );

endmodule
