`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:50:10 PM
// Design Name: 
// Module Name: bcd_up_down_counter
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


module bcd_up_down_counter(
    input wire clk_div,
    input wire rst_n,
    input dir, //1 up 0 down
    output reg [3:0] digit,
    output reg rollover
);
    
    always@(posedge clk_div or posedge rst_n) begin
        if ((dir == 0 && digit == 9) || (dir == 1 && digit == 0)) rollover = 1;
        #5;
        if (rst_n) begin
            #1;
            digit = 4'b0;
            rollover = 0;
            #1;
        end
        else begin
            if (dir == 0) begin
                if (digit == 9) begin
                digit = 0;
                #1;
                end
                else begin
                digit = digit + 1;
                rollover = 0;
                #1;
                end
            end
            if (dir == 1) begin
                if (digit == 0) begin
                digit = 9;
                #1;
                end
                else begin
                digit = digit - 1;
                rollover = 0;
                #1;
                end
            end
        end
        #5;
    end
endmodule
