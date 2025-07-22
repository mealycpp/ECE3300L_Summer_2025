`timescale 1ns / 1ps
module top_lab5(
    input wire CLK,             // Main system clock
    input wire [4:0] SW,        // 5-bit switch input to select clock division
    input wire BTN1,            // Button to toggle count direction
    input wire BTN0,            // Button acting as active-low reset
    output wire [7:0] AN,       // 8-bit anode control for 7-segment display
    output wire [6:0] SEG,      // Segment control (a-g) for 7-segment display
    output wire [12:0] LED      // LED output to show switch and BCD values
);
    // ----------------------------
    // Signal Declarations
    // ----------------------------
    wire rst_n = BTN0;                   // Active-low reset
    wire [4:0] sel_inv = 5'd31 - SW;     // Reverse the switch input for natural frequency scaling
    wire [31:0] count;                   // 32-bit counter from clock divider
    // ----------------------------
    // Clock Divider Module
    // ----------------------------
    clock_divider u_div (
        .CLK(CLK),
        .rst_n(rst_n),
        .counter(count)
    );
    // ----------------------------
    // MUX32x1: Select a bit of counter as divided clock
    // ----------------------------
    wire clk_div;
    mux32x1 u_mux (
        .Sel(sel_inv),
        .cnt(count),
        .clk_out(clk_div)
    );
    // ----------------------------
    // Edge Detection for clk_div (tick signal)
    // Only generates one pulse per clock_div rising edge
    // ----------------------------
    reg div_prev;
    always @(posedge CLK)
        div_prev <= rst_n ? clk_div : 1'b0;

    wire tick = clk_div & ~div_prev;  // One-shot pulse on clk_div rising edge
    // ----------------------------
    // Edge Detection for BTN1 (direction toggle)
    // ----------------------------
    reg btn1_prev;
    always @(posedge CLK)
        btn1_prev <= rst_n ? BTN1 : 1'b0;

    wire btn1_edge = BTN1 & ~btn1_prev;  // One-shot pulse on BTN1 press
    // ----------------------------
    // Direction toggle logic
    // Toggles direction on each BTN1 press
    // ----------------------------
    reg direction;
    always @(posedge CLK) begin
        if (!rst_n)
            direction <= 1'b1;          // Default count up
        else if (btn1_edge)
            direction <= ~direction;    // Toggle direction on BTN1 edge
    end
    // ----------------------------
    // Two-digit BCD counter using cascading
    // ----------------------------
    wire [3:0] units, tens;      // Ones and tens BCD digits
    wire unit_roll;              // Rollover signal from units to tens digit

    bcd_digit_counter u0 (
        .clk(CLK),
        .enable(tick),           // Enabled by divided tick
        .dir(direction),
        .rst_n(rst_n),
        .digit(units),
        .rollover(unit_roll)
    );
    bcd_digit_counter u1 (
        .clk(CLK),
        .enable(unit_roll),      // Enabled only when units rolls over
        .dir(direction),
        .rst_n(rst_n),
        .digit(tens),
        .rollover()              // Not used
    );
    wire [7:0] out_bcd = {tens, units};  // Combine BCD digits into one byte
    // ----------------------------
    // 7-Segment Display Driver
    // Scans and displays the two BCD digits
    // ----------------------------
    wire [1:0] an_active;
    seg7_scan u_seg (
        .AN(an_active),
        .SEG(SEG),
        .out(out_bcd),
        .CLK(CLK),
        .rst_n(rst_n)
    );
    assign AN = {6'b111111, an_active};  // Only enable the last two digits (others off)

    // ----------------------------
    // LED Outputs
    // ----------------------------
    assign LED[4:0] = SW;         // Display switch state
    assign LED[8:5] = units;      // Show units digit
    assign LED[12:9] = tens;      // Show tens digit
endmodule
