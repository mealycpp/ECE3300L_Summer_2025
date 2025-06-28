`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 10:40:19 AM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(
    input a, b,
    input sel,
    output y
    );
    
    wire nsel, a1, b1;
    not (nsel, sel);
    and (a1, a, nsel);
    and(b1, b, asel);
    or (y, a1, b1);
endmodule
