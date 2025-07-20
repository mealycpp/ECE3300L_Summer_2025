`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:40:02 PM
// Design Name: 
// Module Name: mux32x1_tb
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


module mux32x1_tb();
    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;

    mux32x1 uut (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
    );

    initial begin
        cnt = 32'hAAAAAAAA; // 101010...
        $display("Testing mux32x1:");
        for (sel = 0; sel < 32; sel = sel + 1) begin
            #1;
            $display("sel = %0d, cnt[%0d] = %b, clk_out = %b", sel, sel, cnt[sel], clk_out);
        end
    end
endmodule