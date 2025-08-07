`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 06:53:02 AM
// Design Name: 
// Module Name: ShAmt_decoder
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


module ShAmt_decoder(
    input BtnC, BtnU, BtnD, rst, clk,
    output reg [3:0] ShAmt
    );
    reg [1:0] upper;
    wire state;
    
    debounce btnU(.clk(clk), .btn_in(BtnU), .btn_clean(state));
    
    always@(posedge state or negedge rst) begin
        if (!rst) begin
            upper <= 0;
        end
        else begin
            upper = upper + 1;
            #2;
        end
    end
    
    always@(*) begin 
        ShAmt[0] <= BtnD;
        ShAmt[1] <= BtnC;
        ShAmt[3:2] <= upper;
    end
    
endmodule
