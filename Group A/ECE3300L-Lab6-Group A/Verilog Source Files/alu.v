`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 04:28:57 AM
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
    input [3:0] units_BCD, tens_BCD,
    input [1:0] ctrl,
    output reg [7:0] result
    );
    
    always @(ctrl or units_BCD or tens_BCD) begin
        if(ctrl[1]) result = 0;
        else if(~ctrl[0]) result = units_BCD + tens_BCD;
        else begin
            result = units_BCD - tens_BCD;
            if(units_BCD < tens_BCD) result = result + 19;
        end
        
        if(result >= 10) begin
            result[3:0] = result-4'd10;
            result[7:4] = 4'd1;
        end
        
    end
    
endmodule
