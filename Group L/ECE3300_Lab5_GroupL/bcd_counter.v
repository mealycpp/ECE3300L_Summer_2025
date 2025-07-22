`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:21:11 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
input clk,
    input rst,
    input en_in,     
    input upd,       
    output reg [3:0] op, // 4 Bit Output 
    output reg en_out
);
    always @(posedge clk or posedge rst) 
    begin
        // When reset is pressed everything is 0
        if (rst) 
            begin
                op <= 0;
                en_out <= 0;
            end 
        // ????
        else 
            if (en_in)
                begin
                    en_out <= 0;
                    if (upd) 
                        begin
                            if (op == 9) 
                                begin
                                    op <= 0;
                                    en_out <= 1;
                                end 
                            else 
                                begin
                                    op <= op + 1;
                                end
                        end 
                    // ?????    
                    else 
                        begin
                            if (op == 0) 
                                begin
                                    op <= 9;
                                    en_out <= 1; 
                                end 
                            else 
                                begin
                                    op <= op - 1;
                                end
                        end
                end
        end
endmodule