`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:04:16 AM
// Design Name: 
// Module Name: seg7_scan_tb
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


module seg7_scan_tb(

    );
    
    reg clk, rst_n;
    reg [3:0] digit0, digit1;
    wire [6:0] seg;
    wire [7:0] an;
    integer i, j;
    
    seg7_scan driver(
    clk, rst_n, digit0, digit1, seg, an          
);

    initial begin
        rst_n = 1;
        #5 rst_n = 0;
        #5 rst_n = 1;
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        digit0 = 0;
        for(i=0; i<10; i=i+1) begin
            digit1 = i;
            for(j=0; j<10; j=j+1) begin
                #200 digit0 = j;
            end
        end
    end

endmodule
