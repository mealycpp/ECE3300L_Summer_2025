`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/09/2025 11:12:28 AM
// Design Name: 
// Module Name: seg7_driver
// Project Name: seg7_driver
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

module seg7_driver(
    input clk,
    input rst_n,
    input [15:0] SW,
    output reg [6:0] Cnode,
    output dp,
    output [7:0] AN,
    output [15:0] LED
);
    assign LED = SW[15:0];
    reg [19:0] tmp;
    reg [3:0] digit;
    
    assign dp = 1'b1;
    
    always@(digit)
        case(digit)
        4'd0: Cnode=7'b0000001; 4'd1: Cnode=7'b1001111; 4'd2: Cnode=7'b0010010;
        4'd3: Cnode=7'b0000110; 4'd4: Cnode=7'b1001100; 4'd5: Cnode=7'b0100100;
        4'd6: Cnode=7'b0100000; 4'd7: Cnode=7'b0001111; 4'd8: Cnode=7'b0000000;
        4'd9: Cnode=7'b0001100; 4'd10:Cnode=7'b0001000;4'd11:Cnode=7'b1100000;
        4'd12:Cnode=7'b0110001;4'd13:Cnode=7'b1000010;4'd14:Cnode=7'b0110000;
        4'd15:Cnode=7'b0111000;default: Cnode=7'b1111111;
        endcase
        
    always@(posedge clk or negedge rst_n)
        if(!rst_n) tmp<=0;
        else tmp<=tmp+1;
        
    wire [2:0] s = tmp[19:17];
    
    always@(s, SW)
        case (s)
          3'd0: digit = SW[3:0];
          3'd1: digit = SW[7:4];
          3'd2: digit = SW[11:8];
          3'd3: digit = SW[15:12];
          default: digit = 4'b0000;
        endcase
        
    reg [7:0] AN_tmp;
    always@(s)
        case(s)
            3'd0:AN_tmp=8'b11111110;3'd1:AN_tmp=8'b11111101;
            3'd2:AN_tmp=8'b11111011;3'd3:AN_tmp=8'b11110111;
            3'd4:AN_tmp=8'b11101111;3'd5:AN_tmp=8'b11011111;
            3'd6:AN_tmp=8'b10111111;3'd7:AN_tmp=8'b01111111;
            default:AN_tmp=8'b11111111;
        endcase
        
    assign AN=AN_tmp;
endmodule
