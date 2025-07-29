`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 04:28:57 AM
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
    input clk,
    input [7:0] result,
    input [3:0] input_nibble,
    output reg [7:0] AN,
    output reg [6:0] Cnode
    );
    
    reg [13:0] refresh_cnt = 14'd0;
    wire refresh_tick = refresh_cnt[0];
    reg [3:0] digit = 4'd0;
    
    always @(posedge clk) begin
        refresh_cnt <= refresh_cnt + 1;
    end
    
    always @(posedge refresh_tick) begin
        case (AN)
            8'b11111110: AN <= 8'b11111101;
            8'b11111101: AN <= 8'b11111011;
            8'b11111011: AN <= 8'b11111110;
            default: AN <= 8'b11111110;
        endcase
        
        
    end
    
    always @(AN) begin
        case (AN)
            8'b11111110: digit <= result[3:0];
            8'b11111101: digit <= result[7:4];
            8'b11111011: digit <= input_nibble;
        endcase
    end
    
    always @(digit) begin
        case (digit)
            4'd0: Cnode=7'b0000001; 4'd1: Cnode=7'b1001111; 4'd2: Cnode=7'b0010010;
            4'd3: Cnode=7'b0000110; 4'd4: Cnode=7'b1001100; 4'd5: Cnode=7'b0100100;
            4'd6: Cnode=7'b0100000; 4'd7: Cnode=7'b0001111; 4'd8: Cnode=7'b0000000;
            4'd9: Cnode=7'b0001100; 4'd10:Cnode=7'b0001000;4'd11:Cnode=7'b1100000;
            4'd12:Cnode=7'b0110001;4'd13:Cnode=7'b1000010;4'd14:Cnode=7'b0110000;
            4'd15:Cnode=7'b0111000;default: Cnode=7'b1111111;
        endcase
    end
    
endmodule
