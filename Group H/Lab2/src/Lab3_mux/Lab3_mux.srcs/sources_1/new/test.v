`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2025 01:24:17 PM
// Design Name: 
// Module Name: test
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


module button_test (
  input btnU, btnD, btnL, btnR,
  output LED1, LED2, LED3, LED4
);

assign LED1 = btnU;
assign LED2 = btnD;
assign LED3 = btnL;
assign LED4 = btnR;

endmodule
