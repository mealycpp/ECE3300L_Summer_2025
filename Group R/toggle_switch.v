`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 03:17:41 PM
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

module toggle_switch (
                    input clk,
                    input rst,
                    input btn_raw,
                    output reg state
                    );
                    
wire btn_clean;
reg btn_prev;

debounce db (.clk(clk), .btn_in(btn_raw), .btn_clean(btn_clean));

always @(posedge clk) 
    begin
        if (rst) 
        begin
            state <= 0;
            btn_prev <= 0;
        end 
        else 
        begin
            if (btn_clean && !btn_prev)
            state <= ~state;
            btn_prev <= btn_clean;
        end
    end
endmodule