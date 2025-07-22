`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:43:41 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb(

    );
  reg clk = 0, rst_n = 0;
  wire [31:0] counterIn;

  clock_divider uut (.clock_in(clk), .rst_n(rst_n), .counterIn(counterIn));

  always #5 clk = ~clk;

  initial begin
    #20  rst_n = 1;     
    #1000_000;          
    $finish;
  end
    
    
endmodule
