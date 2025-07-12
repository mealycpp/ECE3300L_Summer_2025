`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 01:49:28 AM
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
    reg clk_tb, rst_n_tb;
    reg [31:0] SW_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] An_tb;


    integer i;

    seg7_driver A(
        .clk(clk_tb),
        .rst_n(rst_n_tb),
        .SW(SW_tb),
        .Cnode(Cnode_tb),
        .dp(dp_tb),
        .AN(AN_tb)
    );

    always 
        begin
            #5 clk_tb = ~clk_tb;
        end
    initial
        begin
            SW_tb = 32'b0111_0110_0101_0100_0011_0010_0001_0000;
            #80;
            SW_tb = 32'b1111_1110_1101_1100_1011_1010_1001_1000;
        end

    initial 
    begin 
        clk_tb = 0;
        rst_n_tb = 0;
        #5 rst_n_tb = 1;
        for(i = 1; i < 16; i = i+1)
            begin
                $display("Current i = ", i);
                #10;
            end
        $finish;
    end 



    

    
endmodule
