`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 07/17/2025 01:23:39 PM
// Design Name: Top Module
// Module Name: top
// Project Name: top_module
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This is the top level module for the BCD Up/Down Counter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top (
    input  wire        CLK, //sys clock input
    input  wire [4:0]  SW, //5 switches for clock divider control
    input  wire        BTN1, //counting rising edge
    input  wire        BTN0, //system reset
    output wire [7:0]  AN,  //anode control for 7 seg
    output wire [6:0]  SEG,
    output wire [12:0] LED //13 leds for BCD counter
);
    wire rst_n = ~BTN0;      
    reg btn1_d; //button debouncing
    always @(posedge CLK) btn1_d <= BTN1;

    reg dir;                
    always @(posedge CLK or negedge rst_n) begin
        if (!rst_n) dir <= 1'b1;                        //sets default counting direction to up
        else if ( BTN1 & ~btn1_d ) dir <= ~dir;    //toggle directino with BTN1
    end

    //generates tick input
    wire tick;
    clk_divider u_tick (
        .clk (CLK), .rst_n(rst_n), .sw(SW), .tick(tick)
    );

    wire [3:0] units, tens;
    bcd_counter u_counter (
        .clk(CLK), .rst_n(rst_n), .tick(tick), .dir(dir),
        .units(units), .tens(tens)
    );

    //calls units and tens digit onto 7 seg
    seg7_driver u_sevenseg (
        .clk(CLK), .rst_n(rst_n),
        .units(units), .tens(tens),
        .SEG(SEG), .AN(AN[1:0])
    );
    assign AN[7:2] = 6'b111111; 

    //led outputs
    assign LED[3:0]  = units;
    assign LED[7:4]  = tens;
    assign LED[12:8] = {3'b000, SW}; 
endmodule