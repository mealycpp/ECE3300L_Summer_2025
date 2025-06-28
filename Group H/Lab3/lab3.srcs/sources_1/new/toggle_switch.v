`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 10:47:12 AM
// Design Name: 
// Module Name: toggle_switch
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


module toggle_switch(
    input clk,
    input rst,
    input btn_raw,
    output reg state
    );
    wire btn_clean;
    reg btn_prev;
 
    debounce db (.clk(clk), .btn_in(btn_raw), .btn_clean(btn_clean));
    
    always @(posedge clk) begin
        if (rst) begin
             state <= 1'b0;
             btn_prev <= 1'b0;
        end else begin
             if (btn_clean && !btn_prev) begin
                state <= ~state;
                end
             btn_prev <= btn_clean;
        end
    end
endmodule
