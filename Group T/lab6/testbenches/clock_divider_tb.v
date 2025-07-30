`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 02:13:31 AM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb(

    );

    reg clk_tb = 0;
    reg [31:0] rst_tb = 0;
    reg [4:0] sel_tb = 0;
    wire clk_out_tb;

    clock_divider A(
        .clk(clk_tb),
        .rst(rst_tb),
        .sel(sel_tb),
        .clk_out(clk_out_tb)
    );

    integer i, j;

    always 
        begin
            #5 clk_tb = ~clk_tb;
        end

    initial 
    begin 
        #5 rst_tb = 1;
        #5 rst_tb = 0;
        for(i = 0; i < 32; i = i+1) begin
            sel_tb = sel_tb + 1;
                for(j = 0; j < 100; j = j+1)
                    begin
                        #10;
                    end
            end
        $finish;
    end

endmodule
