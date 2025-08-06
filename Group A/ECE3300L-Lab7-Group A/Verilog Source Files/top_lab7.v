`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
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

//BTNC = increment shamt [3:2] every positive clock edge
//BTND = shamt[0]
//BTNU = shamt[1]
//BTNL = dir (0 = left, 1 = right)
//BTNR = rotate (0 = logical, 1 = rotate)

module top_lab7(
    input CLK, BTNC, BTNU, BTND, BTNL, BTNR,
    input [15:0] SW,
    output [5:0] LED,
    output [7:0] AN,
    output [6:0] SEG
    );
    
    wire BTNUtoggle, BTNDtoggle, BTNLtoggle, BTNRtoggle;
    wire [1:0] shamt;
    wire [15:0] outputData;
    
    clock_divider_fixed #(.DIV_VALUE(27'd50_000)) scanClk(CLK, clk_1kHz);
    clock_divider_fixed #(.DIV_VALUE(27'd100_000_000)) shamtClk(CLK, clk_2Hz);
    
    debounce_toggle togU(BTNU, clk_1kHz, BTNUtoggle);
    debounce_toggle togD(BTND, clk_1kHz, BTNDtoggle);
    debounce_toggle togL(BTNL, clk_1kHz, BTNLtoggle);
    debounce_toggle togR(BTNR, clk_1kHz, BTNRtoggle);
    
    shamt_counter cnt(clk_2Hz, BTNC, shamt);
    
    barrel_shifter16 shifter(SW, {shamt, BTNUtoggle, BTNDtoggle}, BTNLtoggle, BTNRtoggle, outputData);
    
    seg7_scan8 scan(clk_1kHz, outputData, AN, SEG);
    
    assign LED = {BTNLtoggle, BTNRtoggle, shamt, BTNDtoggle, BTNUtoggle};
    
    
endmodule
