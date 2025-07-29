`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:12:17 PM
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
    input wire rst_n,
    input wire clk,                 // 100 MHz system clock
    input wire [4:0] sel,           // SW[4:0]
    output wire clk_div,             // selected divided clock
    output reg [31:0] cnt
    );
    
    always @(posedge clk) begin
        if(!rst_n)
            cnt <= 32'b0;
        else
            cnt <= cnt + 1;
    end

    assign clk_div = cnt[sel];  // select one of the bits based on SW[4:0]
    
endmodule
