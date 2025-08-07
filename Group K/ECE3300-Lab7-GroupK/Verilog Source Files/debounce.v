`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 06:51:54 PM
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
    input btn,
    output reg btn_in
    );
        reg [2:0] shift;
        
        always @(posedge clk) begin
            shift <= {shift[1:0], btn};
                if (shift == 3'b111) btn_in <= 1;
                else if (shift == 3'b000) btn_in <= 0;
        end
endmodule
