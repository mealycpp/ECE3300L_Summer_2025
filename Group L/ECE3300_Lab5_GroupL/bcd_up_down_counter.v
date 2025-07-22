`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:22:00 PM
// Design Name: 
// Module Name: bcd_up_down_counter
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


module bcd_up_down_counter(
    input clk,              
    input rst_n,            
    input dir,              
    output [3:0] units,
    output [3:0] tens     
);
    wire en = 1'b1;
    wire en_tens;

    // The first Digit 
    bcd_counter UNIT (
        .clk(clk),
        .rst(rst_n),
        .en_in(en),
        .upd(dir),
        .op(units),
        .en_out(en_tens)
    );
    
    // Second Digit
    bcd_counter TENS (
        .clk(clk),
        .rst(rst_n),
        .en_in(en_tens),
        .upd(dir),
        .op(tens),
        .en_out() // unused
    );
endmodule