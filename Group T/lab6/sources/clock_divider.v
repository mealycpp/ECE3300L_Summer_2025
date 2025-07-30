`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 12:54:07 AM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
        input clk,
        input rst_n,
        input [4:0] sel,
        output clk_out
    );
    
    reg [31:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) counter <= 0;
        else
            counter <= counter + 1;
    end
    assign clk_out = counter[sel];  
endmodule
