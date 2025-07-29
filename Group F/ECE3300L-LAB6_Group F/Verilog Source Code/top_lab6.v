`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:29:53 PM
// Design Name: 
// Module Name: top_lab6
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


module top_lab6(
    input wire clk,
    input wire rst_n,      
    input wire [8:0] SW,
    output wire [7:0] AN,
    output wire [6:0] SEG,
    output wire [7:0] LED
    );
    
    wire clk_div;           
    wire [31:0] count;        
    wire [3:0] ones_BCD;
    wire [3:0] tens_BCD;
    wire [3:0] ctrl_nibble;
    wire [7:0] result;
    

    clock_divider clock_divider_inst (
        .clk(clk),
        .rst_n(rst_n),
        .select(SW[4:0]),
        .clk_div(clk_div),
        .count(count) 
    );

    bcd_counter ones_inst (
        .clk(clk),              
        .rst_n(rst_n),        
        .dir(SW[7]),
        .BCD(ones_BCD)
    );

    bcd_counter tens_inst (
        .clk(clk),              
        .rst_n(rst_n),
        .dir(SW[8]),
        .BCD(tens_BCD)
    );
    
    alu alu_inst (
        .A(ones_BCD),
        .B(tens_BCD),
        .ctrl(SW[6:5]),
        .result(result)
    );

    control_decoder cntrl_decoder_inst (
        .ctrl_in(SW[8:5]),
        .ctrl_out(ctrl_nibble)
    );

    seg7_scan seg7_scan_inst (
        .clk(clk),
        .rst_n(rst_n),
        .digit_0(result[3:0]),
        .digit_1(result[7:4]),
        .digit_2(ctrl_nibble),
        .SEG(SEG),
        .AN(AN)
    );
    
    assign LED = result;
    assign AN[7:3] = 5'b11111;
    
endmodule