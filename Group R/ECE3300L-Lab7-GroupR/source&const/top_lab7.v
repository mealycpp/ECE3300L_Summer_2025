`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// Module Name: top_lab7
//////////////////////////////////////////////////////////////////////////////////

module top_lab7(
    input  wire        CLK,                 
    input  wire [15:0] SW,           
    input  wire [ 4:0] BTN,           
    output wire [ 7:0] LED,          
    output wire [ 6:0] SEG,          
    output wire [ 7:0] AN            
);

    // 100 MHz → 1 kHz & demo clocks
    wire clk_1kHz, clk_demo;
    clock_divider_fixed clkdiv (
        .clk(CLK),
        .clk_1kHz(clk_1kHz),
        .clk_demo(clk_demo)
    );

    // debounce toggles for directions & shifts
    wire dir, rot, sham0, sham1, btnc_tog;
    debounce_toggle db_dir  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[4]), .btn_toggle(dir));
    debounce_toggle db_rot  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[3]), .btn_toggle(rot));
    debounce_toggle db_s0   (.clk_1kHz(clk_1kHz), .btn_raw(BTN[2]), .btn_toggle(sham0));
    debounce_toggle db_s1   (.clk_1kHz(clk_1kHz), .btn_raw(BTN[1]), .btn_toggle(sham1));
    debounce_toggle db_btnc (.clk_1kHz(clk_1kHz), .btn_raw(BTN[0]), .btn_toggle(btnc_tog));

    // synchronous 2-bit counter on btnc_tog
    reg [1:0] shamt_high = 2'b00;
    always @(posedge clk_demo) begin
        if (BTN[0])
            shamt_high <= shamt_high + 1;
    end

    wire [3:0] shamt = {shamt_high, sham1, sham0};

    // barrel shifter
    wire [15:0] result;
    barrel_shifter16 shifter (
        .data_in(SW),
        .shamt(shamt),
        .dir(dir),
        .rotate(rot),
        .data_out(result)
    );

    assign LED[7:4] = shamt;
    assign LED[3]   = rot;
    assign LED[2]   = dir;
    assign LED[1:0] = 2'b00;

    // hex → 7-segment
    wire [6:0] digits [7:0];
    hex_to_7dseg h0 (.hex(result[ 3: 0]), .SEG(digits[0]));
    hex_to_7dseg h1 (.hex(result[ 7: 4]), .SEG(digits[1]));
    hex_to_7dseg h2 (.hex(result[11: 8]), .SEG(digits[2]));
    hex_to_7dseg h3 (.hex(result[15:12]), .SEG(digits[3]));
    hex_to_7dseg h4 (.hex(shamt_high), .SEG(digits[4]));
    
//    assign digits[4] = 7'b1111111;
    assign digits[5] = 7'b1111111;
    assign digits[6] = 7'b1111111;
    assign digits[7] = 7'b1111111;

    // 8-digit scanner
    seg7_scan8 scanner (
        .clk_1kHz(clk_1kHz),
        .d0(digits[0]),
        .d1(digits[1]),
        .d2(digits[2]),
        .d3(digits[3]),
        .d4(digits[4]),
        .d5(digits[5]),
        .d6(digits[6]),
        .d7(digits[7]),
        .AN(AN),
        .SEG(SEG)
    );
endmodule
