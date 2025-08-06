`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
// Design Name: 
// Module Name: clock_divider_fixed
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


module clock_divider_fixed #(parameter DIV_VALUE = 27'd50_000_000)(
        input clk,
        output reg clk_out
    );
    
    reg [26:0] cnt;
    
    initial begin
        cnt = 27'd0;
        clk_out = 0;
    end
    
    always @(posedge clk) begin
        if (cnt == DIV_VALUE) begin
            cnt <= 0;
            clk_out <= ~clk_out;
        end
        else cnt <= cnt + 1;
    end
endmodule
