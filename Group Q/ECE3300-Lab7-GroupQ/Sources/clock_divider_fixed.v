`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 09:27:53 PM
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


module clock_divider_fixed #(parameter DIV_VALUE = 26'd50_000_000)(
    input clk,
    output reg clk_out = 0
);
    reg [25:0] counter = 0;
    always @(posedge clk) begin
        if (counter == DIV_VALUE) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else
            counter <= counter + 1;
    end
endmodule