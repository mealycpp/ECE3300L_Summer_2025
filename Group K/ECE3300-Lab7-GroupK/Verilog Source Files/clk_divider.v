`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 07:07:40 AM
// Design Name: 
// Module Name: clk_divider
// Project Name: clk_divider
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


module clk_divider(
    input wire clk,         
    input wire rst_n,       
    output reg clk_out    
);

    reg [25:0] cnt;
    parameter div = 26'd50_000;  // Half-period count

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
            clk_out <= 0;
        end else begin
            if (cnt == div - 1) begin
                cnt <= 0;
                clk_out <= ~clk_out;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

endmodule