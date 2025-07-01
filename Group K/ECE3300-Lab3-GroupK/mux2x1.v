`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 07/01/2025 12:28:38 PM
// Design Name: 2x1 Multiplexer
// Module Name: mux2x1
// Project Name: 2x1 Mux
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This is a 2x1 multiplexer to be instantiated in a 16x1 mux
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2x1(
    input a,
    input b,
    input sel,
    output y
);
    wire nsel, a1, b1;
    not (nsel, sel);
    and (a1, a, nsel);
    and (b1, b, sel);
    or (y, a1, b1);
endmodule
