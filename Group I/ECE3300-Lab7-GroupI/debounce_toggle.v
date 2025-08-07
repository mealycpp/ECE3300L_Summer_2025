`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:49:13 PM
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
    input clk_1kHz,           // sampling clock (e.g., 1 kHz)
    input rst,           // synchronous reset
    input btn_raw,       // raw button input
    output reg state,    // toggled output
    output reg btn_toggle // 1-cycle pulse on clean rising edge
);
    reg [2:0] shift_reg = 3'b000;
    reg btn_clean = 0;
    reg btn_prev = 0;

    always @(posedge clk_1kHz) begin
        // Debounce logic: 3-sample shift register
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111)
            btn_clean <= 1;
        else if (shift_reg == 3'b000)
            btn_clean <= 0;

        // Edge detection and toggle logic
        if (rst) begin
            state <= 0;
            btn_prev <= 0;
            btn_toggle <= 0;
        end else begin
            btn_toggle <= 0;  // default to 0
            if (btn_clean && !btn_prev) begin
                    state <= ~state;
                btn_toggle <= 1;  // generate 1-cycle pulse
            end
            btn_prev <= btn_clean;
        end
    end
endmodule