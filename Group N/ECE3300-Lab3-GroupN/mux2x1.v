`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 02:07:23 PM
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
    input a,b,
    input sel,
    output y
    );
    wire nsel, a1, b1; // notSelect
    
    not (nsel, sel); //when sel = 1, nsel = 0
    and (a1, a, nsel); // when nsel = 1 AND a, then a1 = a. 
    and (b1, b, sel); //when sel = 0 AND b, then b = 0
    or (y, a1, b1);
    
endmodule
