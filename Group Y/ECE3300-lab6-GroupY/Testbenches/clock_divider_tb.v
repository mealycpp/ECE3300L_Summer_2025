`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:51:33 PM
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


module clock_divider_tb();

    // Inputs
    reg clk;
    reg rst;
    reg [4:0] speed_sel;
    wire clk_out;
    
    clock_divider uut (
        .clk(clk),
        .rst(rst),
        .speed_sel(speed_sel),
        .clk_out(clk_out)
    );

    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
   
    initial begin
        rst = 1;
        speed_sel = 5'd2;
        #20;
        rst = 0;
        #500;
        speed_sel = 5'd4;
        #500;
        speed_sel = 5'd6;  
        #500

        $finish;
    end

    initial begin
        $monitor("Time = %0t , clk = %b , rst = %b , speed_sel = %d , clk_out = %b",
                 $time, clk, rst, speed_sel, clk_out);
    end

endmodule
