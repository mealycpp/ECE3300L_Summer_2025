`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 03:29:16 PM
// Design Name: 
// Module Name: seg7_driver_tb
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


module seg7_driver_tb(
    );
    reg clk, rst_n;
    reg [1:0] sel;
    reg [7:0] partValue;
    reg [9:0] switchInput;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;
    integer i, j;
    
    seg7_driver_top seg7(clk, rst_n, switchInput, Cnode, dp, AN);
    
    initial 
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    initial 
        begin
            rst_n = 1;
            #10 rst_n = 0;
            for(i=0; i<4; i=i+1) begin
                sel = i;
                for(j=0; j<256; j=j+1) begin
                    #10 partValue = j;
                end
            end
        end
    
    always @(sel, partValue) begin
        switchInput = {sel, partValue};
    end
    
endmodule
