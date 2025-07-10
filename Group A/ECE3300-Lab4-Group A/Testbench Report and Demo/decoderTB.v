`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 07:38:22 AM
// Design Name: 
// Module Name: decoderTB
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


module decoderTB(

    );
    reg clk, rst_n;
    reg [1:0] sel;
    reg [7:0] partValue;
    wire [9:0] ledOutput;
    reg [9:0] switchInput;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;
    integer i, j;
    
    MainProgram ced(clk, rst_n, switchInput, ledOutput, Cnode, dp, AN);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst_n = 1;
        #10 rst_n = 0;
        #10 rst_n = 1;
        /*for(i=0; i<4; i=i+1) begin
            sel = i;
            for(j=0; j<256; j=j+1) begin
                #10 partValue = j;
            end
        end*/
        sel = 2'b00;
        #1 partValue = 8'hCE;
        #25 sel = 2'b01;
        #1 partValue = 8'hFA;
        #25 sel = 2'b10;
        #1 partValue = 8'hAD;
        #25 sel = 2'b11;
        #1 partValue = 8'hDE;
    end
    
    always @(sel, partValue) begin
        switchInput = {sel, partValue};
    end
    
   /* reg clk, rst_n;
    reg [31:0] SW;
    wire [7:0] AN;
    wire [6:0] Cnode;
    wire dp;
    integer i;
    
    seg7_driver driver(clk, rst_n, SW, Cnode, dp, AN);
    
    initial begin
        SW = 0;
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst_n = 1;
        #5 rst_n = 0;
        #5 rst_n = 1;
        for(i=0; i<16; i=i+1) begin
            #5 SW = i;
        end
    end */
    
endmodule
