`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 04:51:58 PM
// Design Name: 
// Module Name: debounce
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


module debounce (
input clk,
input btn_in,
output reg btn_clean
);
reg [2:0] shift_reg; // 3 bit shift register
always @(posedge clk) begin
shift_reg <= {shift_reg[1:0], btn_in}; // on posedge of clock, feed button input to lsb of shift reg
if (shift_reg == 3'b111) btn_clean <= 1; // once shift reg is 111, button input is clean and set to 1
else if (shift_reg == 3'b000) btn_clean <= 0; // once shift reg is 000, button input is set to 0
end
endmodule
