`timescale 1ns / 1ps

module top_lab5(
    input wire CLK,
    input wire [4:0] SW,
    input wire RST, // reset 
    input wire BTN1, // dir
    output wire [4:0] LED_SW,
    output wire [7:0] LED_BCD,
    output wire [6:0] SEG,
    output wire [7:0] AN
);
    wire rst_n = ~RST;
    wire dir;

    wire [31:0] cnt;
    wire clk_out;

    wire [3:0] units, tens; //BCD value 
    
    assign LED_SW = SW; // assignment of value LEDS
    assign LED_BCD = {tens, units};

    toggle_switch dir_toggle ( //intialization of modules 
        .clk(CLK),		//Direction toggle
        .btn_raw(BTN1),
        .state(dir)
    ); 

    clock_divider u_clkdiv ( // Clock Division
        .clk(CLK),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    mux32x1 u_mux (
        .cnt(cnt),
        .sel(SW),
        .clk_out(clk_out)
    );

    bcd_up_down_counter u_counter (
        .clk(clk_out),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(units),
        .digit1(tens)
    );

    seg7_scan u_seg (
        .clk(CLK),
        .rst_n(rst_n),
        .digit0(units),
        .digit1(tens),
        .SEG(SEG),
        .AN(AN)
    );

endmodule

