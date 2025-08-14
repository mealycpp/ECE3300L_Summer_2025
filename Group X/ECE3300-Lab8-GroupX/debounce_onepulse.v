`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 05:45:50 PM
// Design Name: 
// Module Name: debounce_onepulse
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


module debounce_onepulse #(
    parameter integer STABLE_TICKS = 20
)(
    input wire clk,
    input wire rst_n,
    input wire din,
    output reg pulse
);
    reg d0, d1;
    reg stable, stable_q;
    reg [$clog2(STABLE_TICKS+1)-1:0] cnt;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin d0<=0; d1<=0; end else begin d0<=din; d1<=d0; end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin cnt<=0; stable<=0; end
        else if (d1 != stable) begin 
            if (cnt==STABLE_TICKS) begin stable<=d1; cnt<=0; end
            else cnt<=cnt+1;
        end else cnt<=0;
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin stable_q<=0; pulse<=0; end
        else begin pulse <= (~stable_q) & stable; stable_q <= stable; end
    end
endmodule
