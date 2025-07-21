`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 06:06:37 PM
// Design Name: 
// Module Name: top_lab5
// Project Name: 
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


module top_lab5(
    input        CLK,     
    input        BTN0,    // Reset
    input        BTN1,    // Dir
    input  [4:0] SW,      
    output [6:0] SEG,     // Segments a-g 
    output [7:0] AN,      
    output [12:0] LED      
    );
   // Instantiate clock divider 
    wire [31:0] cnt;
    clock_divider u_div (
        .clk (CLK),
        .rst_n (!BTN0),   // Active-low reset
        .cnt (cnt)
    );

    // Instantiate 32x1 mux
    wire clk_out;    
    mux32x1 u_mux (
        .cnt (cnt),   
        .sel (SW),
        .clk_out (clk_out)
    );

 wire [3:0] unit_bcd, tens_bcd; 
 wire [3:0] digit0, digit1;
assign digit0 = unit_bcd; // assign digit 0 to ones
assign digit1 = tens_bcd; // assign digit 1 to tens
  wire       unit_roll;
   // instantiate the units-digit counter
  bcd_up_down_counter u_unit (
    .clk_div   (clk_out),    // from mux32x1
    .rst_n     (!BTN0),      // reset button
    .dir       (!BTN1),        // up/down button
    .bcd_value (unit_bcd),   // output = units digit
    .roll      (unit_roll)   // pulse when units wraps 0 to 9
  );

  // instantiate the tens-digit counter
  bcd_up_down_counter u_tens (
    .clk_div   (unit_roll),  // advance on roll
    .rst_n     (!BTN0),
    .dir       (!BTN1),
    .bcd_value (tens_bcd),   // output = tens digit
    .roll      ()   
  );
    // Instantiate 7-segment scan
    wire [1:0] an_2dig;     
    seg7_scan u_scan (
        .clk (CLK),     
        .rst_n (!BTN0),
        .digit0 (digit0),
        .digit1 (digit1),
        .seg (SEG),
        .an (an_2dig)
    );


    // LEDs
    assign LED[4:0] = SW;                          // Switch setting
    assign LED[8:5] = digit0;                      // BCD value
    assign LED[12:9]= digit1;                   // BCD ten value
    assign AN = {6'b111111, an_2dig};  // display only two digits
endmodule
