`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:40:52 AM
// Design Name: 
// Module Name: top_lab5
// Project Name: top_lab5
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

module top_lab5 (
    input        CLK,     
    input        BTN0,    // Reset
    input        BTN1,    // Dir
    input  [4:0] SW,      
    output [6:0] SEG,     // Segments a–g 
    output [1:0] AN,      
    output [12:0] LED      
);

  // 1. Instantiate clock divider 
    wire [31:0] cnt;
    clock_divider u_div (
        .clk (CLK),
        .rst_n (!BTN0),   // Active‑low reset
        .cnt (cnt)
    );

    // 2.  Instantiate 32x1 mux
    wire clk_out;         
    mux32x1 u_mux (
        .cnt (cnt),   
        .sel (SW),
        .clk_out (clk_out)
    );

    // 3.  Instantiate up/down counter
    wire [3:0] digit0;    // Ones Digit
    wire [3:0] digit1;    // Tens Digit
    bcd_up_down_counter u_bcd (
        .clk (clk_out),  
        .rst_n (!BTN0),
        .dir (BTN1),     // BTN1 high = up
        .digit0 (digit0),
        .digit1 (digit1)
    );

    // 4. Instantiate 7‑segment scan
    seg7_scan u_scan (
        .clk (CLK),     
        .rst_n (!BTN0),
        .digit0 (digit0),
        .digit1 (digit1),
        .seg (SEG),
        .an (AN)
    );


    // 5. LEDs
    assign LED[4:0] = SW;                        // Switch setting
    assign LED[8:5] = digit0;          // BCD value
    assign LED[12:9]   = digit1;                   // BCD ten value

endmodule
