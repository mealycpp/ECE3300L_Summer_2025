`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 10:55:14 PM
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
    reg clk_tb;
    reg rst_n;
    reg [15:0] SW_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;
    
    seg7_driver uut (
        .clk(clk_tb),
        .rst_n(rst_n),
        .SW(SW_tb),
        .Cnode(Cnode_tb),
        .dp(dp_tb),
        .AN(AN_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    initial begin
        clk_tb = 0;
        rst_n = 0;
        SW_tb = 32'h00000000; 
        
        #100 rst_n = 1'b1;      
    
        SW_tb = 32'hABCDEF09; 
        
        #2000000; 

        $display("Simulation ended.");
        $finish;
    end
endmodule
