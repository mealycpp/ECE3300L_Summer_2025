`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 10:51:09 AM
// Design Name: 
// Module Name: debounce_toggle
// Project Name: debounce_toggle
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
    input wire clk_1kHz,       
    input wire btn_raw,       
    output reg btn_toggle = 0 
);

    reg [2:0] shift_reg = 3'b000;
    reg debounced = 0;
    reg prev_debounced = 0;

    always @(posedge clk_1kHz) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111)        // Debounced value = 1 if all 3 bits are high, 0 if all 3 bits are low
            debounced <= 1;
        else if (shift_reg == 3'b000)
            debounced <= 0;
        if (~prev_debounced && debounced)     // Toggle output on rising edge of debounced signal
            btn_toggle <= ~btn_toggle;

        prev_debounced <= debounced;         // Save previous debounced state
    end
endmodule

