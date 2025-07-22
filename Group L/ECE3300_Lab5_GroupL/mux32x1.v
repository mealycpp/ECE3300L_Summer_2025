`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:20:25 PM
// Design Name: 
// Module Name: mux32x1
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


module mux32x1(

  input [31:0] count,     
    input [4:0] sel,        
    output clk_out           
);
    assign clk_out = count[sel];  
endmodule