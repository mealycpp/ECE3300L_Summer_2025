`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
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
    input btn_raw,
    input clk,
    output reg btn_toggle
    );
    
    reg [2:0] shift_reg;
    reg prevOn;
    
    initial begin
        shift_reg = 3'b000;
        prevOn = 0;
        btn_toggle = 0;
    end
    
    always @(posedge clk) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111 && !prevOn) begin
            btn_toggle <= ~btn_toggle;
            prevOn <= 1;
        end
        else if (shift_reg == 3'b000) prevOn <= 0;
    end
    
endmodule
