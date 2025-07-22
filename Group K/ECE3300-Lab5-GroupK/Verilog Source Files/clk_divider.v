`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2025 09:57:50 AM
// Design Name: Clock Divider
// Module Name: clk_divider
// Project Name: Clock Divider
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This file creates a clock slower from the system so the bcd counter is readable
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_divider(
    input  wire        clk,  //sys clock input
    input  wire        rst_n,   //active low
    input  wire [4:0]  sw,   //5 bit switch input    
    output wire        tick    //single cycle tick output 
);
    //32 bit counter, reset to 0 on rst_n low
    reg [31:0] ctr;
    always @(posedge clk or negedge rst_n)
        ctr <= !rst_n ? 32'd0 : ctr + 32'd1;

    wire [4:0] tap = 5'd31 - sw; //higher 'sw' values = faster tick, lower 'sw' values = slower tick

    //store previous value of ctr(tap) 
    reg tap_d1;
    always @(posedge clk) tap_d1 <= ctr[tap];

    assign tick =  ctr[tap] & ~tap_d1; 
endmodule