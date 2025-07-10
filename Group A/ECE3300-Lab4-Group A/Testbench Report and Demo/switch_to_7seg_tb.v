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


module swtich_to7seg_tb(

    );
    reg clk;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;
    wire [10:0]ledOutput;

    reg [10:0] SW_in = 11'b0; // SW_in[10] = rst_n, SW_in[9:8] = switchPart, SW_in[0:7] = partValue;
    
    MainProgram test(
        .clk(clk), 
        .SW_in(SW_in), 
        .led(ledOutput), 
        .Cnode(Cnode), 
        .dp(dp), 
        .AN(AN)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        #10 SW_in[10] = 1;
        #10 SW_in[10] = 0;
        #10 SW_in[10] = 1;
        
        for(integer i=0; i<4; i=i+1) begin
            for(integer j=0; j<15; j=j+1) begin
                // SW_in[10]=1, SW_in[9:8] = i, SW_in[7:0] = j;
                //
                // rst_n:       SW_in[10]
                // selector:   SW_in[9:8]
                // value:       SW_in[7:0]
                SW_in = {1, i[1:0], j[7:0]}; 
                $display("rst_n=%b | switchPart=%b | partValue=%0d", 
                         SW_in[10], SW_in[9:8], SW_in[7:0]);
                #10;
            end
        end
    end    
    
endmodule

