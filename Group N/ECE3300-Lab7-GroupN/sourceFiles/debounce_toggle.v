`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 06:48:27 PM
// Design Name: 
// Module Name: debounce_toggle
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


module debounce_toggle(
    input clk,          // 1 khz
    input rst,         // active-low reset
    input btn_raw,     // noisy button
    output reg state   // clean toggled output
);
    reg [2:0] shift_reg;
    reg btn_clean;
    reg btn_prev;
    
    // debounce
    always @(posedge clk) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111)
            btn_clean <= 1;
        else if (shift_reg == 3'b000)
            btn_clean <= 0;

        // toggle  
        // had to make rst to !rst to make this work, since the cpu reset button in the XDC file is active-LOW
        
        if (!rst) begin
            state <= 0;
            btn_prev <= 0;
        end else begin
            if (btn_clean && !btn_prev)
                state <= ~state;
            btn_prev <= btn_clean;
        end
    end
    
endmodule
