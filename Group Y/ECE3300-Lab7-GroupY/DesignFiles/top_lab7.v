`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 04:16:18 AM
// Design Name: 
// Module Name: top_lab7
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


module top_lab7(
    input clk,
    input rst,
    input [15:0] SW,
    input BtnC, BtnU, BtnL, BtnR, BtnD,
    output [15:0] LED,
    output [6:0] SEG,
    output [7:0] AN
    );
    
    wire BtnCToggle, BtnUToggle, BtnLToggle, BtnRToggle, BtnDToggle, clk_1khz, clk_2hz;
    wire [15:0] result;
    wire [3:0] ShAmt;
    wire togU, pulse;
    
    toggle Center(.clk(clk), .rst(rst), .btn_raw(BtnC), .state(BtnCToggle));
    toggle Left(.clk(clk), .rst(rst), .btn_raw(BtnL), .state(BtnLToggle));
    toggle Right(.clk(clk), .rst(rst), .btn_raw(BtnR), .state(BtnRToggle));
    toggle Down(.clk(clk), .rst(rst), .btn_raw(BtnD), .state(BtnDToggle));
    ShAmt_decoder Up(.clk(clk), .rst(rst), .ShAmt(ShAmt), .BtnC(BtnCToggle), .BtnD(BtnDToggle), .BtnU(BtnU));
    clock_divider_fixed clock(.clk(clk), .rst(rst), .clk_2hz(clk_2hz), .clk_1khz(clk_1khz));
    
    barrel_shifter16(.control({BtnLToggle,BtnRToggle}), .SW(SW), .ShAmt(ShAmt), .out(result));
    
    seg7_scan8 seg7(.clk(clk), .rst(rst), .bits(result), .AN(AN), .SEG(SEG));
    
    assign LED[3:0] = ShAmt;
    assign LED[6:5] = {BtnLToggle, BtnRToggle};
    
endmodule
