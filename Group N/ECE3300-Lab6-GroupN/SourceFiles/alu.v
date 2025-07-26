`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 08:53:51 PM
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
    input [3:0] A, //units 
    input [3:0] B,  // tens
    input [1:0] ctrl, // SW[6:5]
    output reg [7:0] result
    );
    
    always @(*) begin
    if (ctrl == 2'b00)
        result = A + B;
    else if (ctrl == 2'b01)
        result = A - B;
    else
        result = 8'd0;
end
    
    
endmodule
