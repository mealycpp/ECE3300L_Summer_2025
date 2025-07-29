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
    reg [4:0] computation;  
    
    always @(*) begin
    if (ctrl == 2'b00)
        computation = A + B;
    else if (ctrl == 2'b01)
        computation = A - B;
    else
        computation = 8'd0;
        
        result[7:5] = 0; 
        result[4] = computation / 4'd10; 
        result[3:0] = computation % 4'd10;  
end
       
    
endmodule
