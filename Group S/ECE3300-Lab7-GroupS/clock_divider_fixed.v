`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:30:25 PM
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

module clock_divider_fixed(
    input CLK,
    output reg CLK_2HZ,
    output reg CLK_1KHZ
);
    parameter div_2hz = 26'd25_000_000;    
    parameter div_1khz = 17'd50_000;       
    reg [25:0] cnt_2hz = 0;
    reg [16:0] cnt_1khz = 0;

    always @(posedge CLK) begin
        if (cnt_2hz == div_2hz-1) begin
            cnt_2hz <= 0;
            CLK_2HZ <= ~CLK_2HZ; // toggle output
        end else begin
            cnt_2hz <= cnt_2hz + 1; // else count up
        end
    end

    always @(posedge CLK) begin
        if (cnt_1khz == div_1khz-1) begin
            cnt_1khz <= 0;
            CLK_1KHZ <= ~CLK_1KHZ; // toggle output
        end else begin
            cnt_1khz <= cnt_1khz + 1; // else count up
        end
    end
endmodule