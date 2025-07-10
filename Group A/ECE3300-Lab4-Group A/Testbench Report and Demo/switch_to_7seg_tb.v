`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 07:38:22 AM
// Design Name: 
// Module Name: swtich_to7seg_tb
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

        // rst_n:       SW_in[10]
        // selector:   SW_in[9:8]
        // value:       SW_in[7:0]
    reg [10:0] SW_in = 11'b0; 
    reg [1:0] select;
    reg [7:0] partValue;
    
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
            select = i[1:0];
            for(integer j=0; j<=15; j=j+1) begin
                partValue[3:0] = j[3:0];
                for(integer k=0; k<=15; k=k+1) begin
                    partValue[7:4] = k[3:0];
                    // SW_in[10]=1, SW_in[9:8] = i, SW_in[7:4] = k, SW_in[3:0] = j;
                    SW_in = {1, select, partValue}; 
                    $display("rst_n=%b | switchPart=%b | partValue=%h", 
                             SW_in[10], SW_in[9:8], SW_in[7:0]);
                    #10;
                end
                #10;
            end
        end
    end    
    
endmodule

