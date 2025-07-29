`timescale 1ns / 1ps

module top_lab6(
    input CLK, 
    input rst_n, 
    
    input [8:0] SW, 
    
    output [7:0] LED, 
    output [6:0] SEG,
    output DP, 
    output [7:0] AN 
    
    );
    wire clk_out;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [7:0] finalResult;
    wire [3:0] ctrl_nibble;
    wire [11:0] bits;
    wire [3:0] bcd_units;
    wire [3:0] bcd_tens;

assign bcd_units = finalResult % 10;
assign bcd_tens  = finalResult / 10;

assign bits[11:0] = { ctrl_nibble[3:0], bcd_tens, bcd_units };

    assign LED = {digit1[3:0], digit0[3:0]};
     
    clock_divider clk1 ( .clockIn(CLK), .sel(SW[4:0]), .rst_n(!rst_n), .clk_div(clk_out) );
    
    bcd_counter units ( .clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[7]), .digit(digit0) );
    bcd_counter tens ( .clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[8]), .digit(digit1) );
    
    alu addOrSubtract ( .A(digit0), .B(digit1), .ctrl(SW[6:5]), .result(finalResult) );
    
    control_decoder control ( .controlSW(SW[8:5]), .ctrl_nibble(ctrl_nibble) );
    
    seg7_scan display ( .CLK(CLK), .rst_n(!rst_n), .bits(bits), .SEG(SEG), .AN(AN), .DP(DP) );
    
    
endmodule
