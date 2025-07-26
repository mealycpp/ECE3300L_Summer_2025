`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 09:01:18 PM
// Design Name: 
// Module Name: bcd_tb
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


module bcd_tb(
    );
reg clk;
reg rst_n;
wire [31:0] count;

clock_divider uut( .clk(clk), .rst_n(rst_n), .count(count));

initial begin 
clk = 0;
forever #10 clk=~clk;
end

initial begin
        rst_n = 1;
        #25;
        rst_n = 0;
        #500;
        $finish;
    end
    initial begin
    $monitor("Time=%0t , rst_n=%b , count=%h", $time, rst_n, count);
end
endmodule
