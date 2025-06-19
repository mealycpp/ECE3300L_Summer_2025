`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2025 04:56:17 AM
// Design Name: 
// Module Name: buff
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


module buff(
    //input I0,
    //input I1,
    //output O0,
    //output O1
    input [15:0] SW,
    output [15:0] LED
    );
    
    assign SW = LED;
    //assign O0= I0;
    //assign O1 = I1;
    //assign O = I
    
endmodule
