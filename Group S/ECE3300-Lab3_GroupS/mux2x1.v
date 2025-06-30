`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 04:32:38 PM
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
 // gate level logic: y = a~sel + bsel
wire nsel, a1, b1; // declare wires for ~sel, input 1, and input 2
not (nsel, sel); // ~sel
and (a1, a, nsel); //  a1 = a~sel
and (b1, b, sel); // b1 = bsel
or (y, a1, b1); // y = a1 + b1
endmodule
