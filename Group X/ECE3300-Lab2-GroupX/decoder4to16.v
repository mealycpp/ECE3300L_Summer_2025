`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 03:03:56 PM
// Design Name: 
// Module Name: decoder4to16
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


module decoder4to16(
    input [3:0] SW,
    input en,
    output [15:0] LED
    );
    wire [7:0] low_out;
    wire [7:0] high_out;
    
    wire en_low = en & ~SW[3];
    wire en_high = en & SW[3];
    
    decoder3to8 lower_decoder (
    .SW(SW[2:0]),
    .en(en_low),
    .LED(low_out)
    );
    
    decoder3to8 upper_decoder (
    .SW(SW[2:0]),
    .en(en_high),
    .LED(high_out)
    );
    
    assign LED[7:0] = low_out;
    assign LED[15:8] = high_out;
    
endmodule
