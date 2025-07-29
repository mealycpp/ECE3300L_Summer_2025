`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 05:44:08 PM
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
    input [1:0] control,
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] result
    );
    reg [4:0] math; //5-bit for easy wrapping   
    
    always@(*) begin
        if (control == 0) begin
            math = a + b; //addition
        end
        else if (control == 1) begin
            math = a - b; //subtraction
        end
        else begin
            math = 0;
        end    
        result[7:5] = 0; //wrapping for 0-18
        result[4] = math / 4'd10; //BCD encoding from binary
        result[3:0] = math % 4'd10; //Modulus to find the lower nibble in BCD            
    end  
endmodule
