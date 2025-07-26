`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:50:27 PM
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
    output reg [31:0] count
    );
        always @ (posedge clk) begin 
            if (rst_n) begin // if reset is high
                count = 32'b0; // count is 0
            end
            else
                #100; 
                count = count + 1'b1; // increment counter
        end
endmodule