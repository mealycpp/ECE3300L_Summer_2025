`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 05:43:21 PM
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
    input rst,
    input [4:0] speed_sel,
    output clk_out
);
    reg [31:0] count = 32'b0;
    
    always@(posedge clk) begin
        if (rst) begin
            //resets count if a rst command is sent
            count <= 0;
        end
        else begin
            //count at clock edge
            count = count + 1; 
            #100;
        end
    end
    //MUX for speed select   
    assign clk_out = count[31-speed_sel];  
endmodule
