`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 09:57:24 PM
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


module mux32x1_tb;

    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;
    
    mux32x1 uut (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
        );
        
    initial begin
        // Test LSB = 1
        cnt = 32'b00000000000000000000000000000001;
        for (sel = 0; sel < 32; sel = sel + 1) begin
            #10;
        end

        // Test alternating pattern
        cnt = 32'hA5A5A5A5;
        for (sel = 0; sel < 32; sel = sel + 1) begin
            #10;
        end

        // Test all ones
        cnt = 32'hFFFFFFFF;
        for (sel = 0; sel < 32; sel = sel + 1) begin
            #10;
        end

        $finish;
    end
endmodule
