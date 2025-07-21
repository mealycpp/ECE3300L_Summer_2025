`timescale 1ns / 1ps

module top_lab5 (
    input        CLK,     
    input        rst_n,
    input        BTN,
    input  [4:0] SW,      
    output [6:0] SEG,
    output [7:0] AN,      
    output [12:0] LED      
);

    wire [31:0] cnt;
    clock_divider u_div (
        .clk (CLK),
        .rst_n (!rst_n),
        .cnt (cnt)
    );

    wire clk_out;         
    mux32x1 u_mux (
        .cnt (cnt),   
        .sel (SW),
        .clk_out (clk_out)
    );

    wire [3:0] digit0;
    wire [3:0] digit1;
    bcd_up_down_counter u_bcd (
        .clk (clk_out),  
        .rst_n (!rst_n),
        .dir (BTN),
        .digit0 (digit0),
        .digit1 (digit1)
    );

    seg7_scan u_scan (
        .clk (CLK),     
        .rst_n (!rst_n),
        .digit0 (digit0),
        .digit1 (digit1),
        .seg (SEG),
        .an (AN)
    );

    assign LED[4:0] = SW;
    assign LED[8:5] = digit0;
    assign LED[12:9] = digit1;

endmodule
