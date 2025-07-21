`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 02:16:31 AM
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


module mux32x1_tb(

    );
    
    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;
    integer i;
    
    mux32x1 mux(cnt, sel, clk_out);
    
    initial begin
        cnt = 32'd0;
        for(i=0; i<32; i=i+1) begin
            #5 cnt[i] = 1'b1;
            sel = i;
            #5 cnt[i] = 1'b0;
        end
    end
    
endmodule
