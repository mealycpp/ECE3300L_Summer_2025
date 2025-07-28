`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 06:14:43 PM
// Design Name: 
// Module Name: seg7_scan
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


module seg7_scan(
    input wire clk,
    input wire btn0,
    input wire [7:0] result,   
    input wire [3:0] ctrl_nibble, 
    output reg [6:0] seg,
    output reg [2:0] an
    );
    
    reg [15:0] clk_divider_count = 0;
   wire scan_clk;
    reg [1:0] data_to_display;
    
    always @(posedge clk or posedge btn0) begin
        if (~btn0)
            clk_divider_count <= 0;
        else 
            clk_divider_count <= clk_divider_count + 1;
    end
    
    always @(posedge clk or posedge btn0) begin
        if(~btn0)
             clk_divider_count <= 0;
        else if (scan_clk);
            data_to_display <= data_to_display + 1;
    end
           
    
    always @(*) begin
        case (data_to_display)
            4'h0: seg = 7'b1000000; // 0
            4'h1: seg = 7'b1111001; // 1
            4'h2: seg = 7'b0100100; // 2
            4'h3: seg = 7'b0110000; // 3
            4'h4: seg = 7'b0011001; // 4
            4'h5: seg = 7'b0010010; // 5
            4'h6: seg = 7'b0000010; // 6
            4'h7: seg = 7'b1111000; // 7
            4'h8: seg = 7'b0000000; // 8
            4'h9: seg = 7'b0010000; // 9
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b0000011; // b
            4'hC: seg = 7'b1000110; // C
            4'hD: seg = 7'b0100001; // d
            4'hE: seg = 7'b0000110; // E
            4'hF: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // Off
        endcase
    end
endmodule