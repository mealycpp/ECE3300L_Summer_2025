`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:50:00 PM
// Design Name: 
// Module Name: bcd_counter_tb
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


module bcd_counter_tb(
);
  reg clk = 0;
  reg rst_n = 0;
  reg dir = 1;
  wire [3:0] BCD;

    bcd_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .BCD(BCD)
  );

    always #10 clk = ~clk;

    initial begin
        rst_n = 0; #20;
        rst_n = 1; #200;
        dir = 0; #300;
        $stop;
    end
endmodule
