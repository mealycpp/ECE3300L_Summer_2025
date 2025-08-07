`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:51:58 PM
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
    input CLK_1KHZ,
    input BTN_RAW,
    output reg BTN_TOGGLE
);
    reg [2:0] shift_reg = 0;
    reg last_state = 0;

    always @(posedge CLK_1KHZ) begin
        shift_reg <= {shift_reg[1:0], BTN_RAW};
        if (shift_reg == 3'b111 && !last_state) begin
            BTN_TOGGLE <= ~BTN_TOGGLE;
            last_state <= 1;
        end else if (shift_reg == 3'b000) begin
            last_state <= 0;
        end
    end
endmodule
