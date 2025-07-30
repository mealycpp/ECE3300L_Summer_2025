`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 12:54:07 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] units,
    input [3:0] tens,
    input [1:0] operation_select,
    output reg [7:0] result
    );

    always @(*) begin
    if (operation_select == 2'b00)
        result <= units + tens;
    else
    if (operation_select == 2'b01)
        result <= units - tens;
end
endmodule
