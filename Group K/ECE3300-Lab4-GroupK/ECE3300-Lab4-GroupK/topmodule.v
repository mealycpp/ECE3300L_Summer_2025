`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 10:49:17 AM
// Design Name: 
// Module Name: topmodule
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


module topmodule(
    input clk,
    input rst_n,
    input [15:0] SW,
    output [15:0] led,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN
    );

    assign led = SW;

    // Duplicate each 4-bit group
    wire [31:0] sw = {
        SW[15:12], // digit 8 (AN[7])
        SW[11:8],  // digit 7 (AN[6])
        SW[7:4],   // digit 6 (AN[5])
        SW[3:0],   // digit 5 (AN[4])
        SW[15:12], // digit 4 (AN[3])
        SW[11:8],  // digit 3 (AN[2])
        SW[7:4],   // digit 2 (AN[1])
        SW[3:0]    // digit 1 (AN[0])
    };

    seg7_driver seg7_inst (
        .clk(clk),
        .rst_n(~rst_n),
        .SW(sw),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN)
    );
endmodule

