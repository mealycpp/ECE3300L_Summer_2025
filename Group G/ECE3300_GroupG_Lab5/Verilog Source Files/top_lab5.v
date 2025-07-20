`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:37:02 PM
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
    input CLK,
    input BTN0,        
    input BTN1,        
    input [4:0] SW,    
    output [1:0] AN,   
    output [6:0] SEG,  
    output [4:0] LED,  
    output [7:0] LED_BCD 
);

    wire [31:0] cnt;
    wire clk_mux;
    reg clk_div = 0;
    wire rst_n;
    wire [3:0] digit0, digit1;

    assign rst_n = ~BTN0; 

    clock_divider div(.CLK(CLK), .cnt(cnt));
    mux32x1 mux(.cnt(cnt), .sel(SW), .clk_out(clk_mux));

    always @(posedge CLK) begin
        clk_div <= clk_mux;
    end

    bcd_up_down_counter counter(
        .clk_div(clk_div),
        .rst_n(rst_n),
        .dir(BTN1),
        .digit0(digit0),
        .digit1(digit1)
    );

    seg7_scan display(
        .CLK(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .AN(AN),
        .SEG(SEG)
    );

    assign LED = SW;
    assign LED_BCD = {digit1, digit0};
endmodule
