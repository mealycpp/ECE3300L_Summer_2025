`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 05:14:38 AM
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

    reg clk_tb = 0, rst_tb = 0, dir_tb = 1;
    wire [3:0] bcd_tb;

    bcd_count A(
        .clk_div(clk_tb),
        .rst(rst_tb),
        .dir(dir_tb),
        .bcd(bcd_tb)
    );

    integer i;

    always 
        begin
            #5 clk_tb = ~clk_tb;
        end

    initial 
    begin 
        #5 rst_tb = 1;
        #5 rst_tb = 0;
        for(i = 0; i < 16; i = i+1) begin
            #10;
            end
        dir_tb = 0;
        for(i = 0; i < 16; i = i+1) begin
            #10;
        end
        $finish;    
    end

endmodule

