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

    //clock_divider_fixed
    wire clk_1kHz, clk_demo;
    clock_divider_fixed clkdiv (
        .clk(CLK),
        .clk_1kHz(clk_1kHz),
        .clk_demo(clk_demo)
    );

    //debounce_toggle
    wire dir, rot, sham0, sham1;
    debounce_toggle db_dir (.clk_1kHz(clk_1kHz), .btn_raw(BTN[0]), .btn_toggle(dir));   // BTNU
    debounce_toggle db_rot (.clk_1kHz(clk_1kHz), .btn_raw(BTN[1]), .btn_toggle(rot));   // BTND
    debounce_toggle db_s0  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[2]), .btn_toggle(sham0)); // BTNL
    debounce_toggle db_s1  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[3]), .btn_toggle(sham1)); // BTNR

    // Debounced and edge-detected BTNC (BTN[4])
    wire btnc_toggle;
    wire btnc_pulse;
    
    // Debounce toggle for BTNC (BTN[4])
    debounce_toggle db_btnc (
        .clk(clk_1kHz),
        .btn_raw(BTN[4]),
        .btn_toggle(btnc_toggle)
    );

    // One-pulse generation (positive edge detection)
    reg btnc_prev;
    always @(posedge clk_demo) begin
        btnc_prev <= btnc_toggle;
    end
    assign btnc_pulse = btnc_toggle & ~btnc_prev;
    
    //shamt_counter
    wire [1:0] shamt_high;
    shamt_counter shamtctr (
         .clk(btnc_pulse),   // ✅ now a one-cycle pulse from clk_demo domain
        .rst(~rst_n),
        .shamt_high(shamt_high)
    );

    wire [3:0] shamt = {shamt_high, sham1, sham0};

    //barrel_shifter16
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

    //hex_to_7seg
    wire [6:0] digits[7:0];

    hex_to_7seg h0 (.hex(result[3:0]),   .seg(digits[0]));
    hex_to_7seg h1 (.hex(result[7:4]),   .seg(digits[1]));
    hex_to_7seg h2 (.hex(result[11:8]),  .seg(digits[2]));
    hex_to_7seg h3 (.hex(result[15:12]), .seg(digits[3]));

    // Blank unused digits (AN4–AN7)
    assign digits[4] = 7'b1111111;
    assign digits[5] = 7'b1111111;
    assign digits[6] = 7'b1111111;
    assign digits[7] = 7'b1111111;

    //seg7_scan8
    seg7_scan8 scanner (
    .clk_1kHz (clk_1kHz),
    .d0       (d0),
    .d1       (d1),
    .d2       (d2),
    .d3       (d3),
    .d4       (d4),  
    .d5       (d5),
    .d6       (d6),
    .d7       (d7),
    .AN       (AN),
    .SEG      (SEG)
);
endmodule
