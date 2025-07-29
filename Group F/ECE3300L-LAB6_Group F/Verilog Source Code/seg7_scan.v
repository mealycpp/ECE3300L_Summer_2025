`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:30:15 PM
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
    input wire rst_n,
    input wire [3:0] ones,
    input wire [3:0] tens,
    input wire [3:0] ctrl_nibble, 
    output reg [6:0] SEG,
    output reg [7:0] AN
    );
    
    reg [15:0] refresh_count = 0;
    reg [1:0] select = 0;
    wire [3:0] current;

    always @(posedge clk) begin 
            refresh_count <= refresh_count + 1;
        end

    always @(posedge refresh_count[15]) begin
        select <= select +1;
    end
  
   always @(*) begin
        case (select)
            2'd0: AN = 3'b110;                  // AN0
            2'd1: AN = 3'b101;                  // AN1
            2'd2: AN = 3'b011;                  // AN2
            default: AN = 3'b111;
        endcase
        
        case (current)
            4'h0: SEG = 7'b1000000; // 0
            4'h1: SEG = 7'b1111001; // 1
            4'h2: SEG = 7'b0100100; // 2
            4'h3: SEG = 7'b0110000; // 3
            4'h4: SEG = 7'b0011001; // 4
            4'h5: SEG = 7'b0010010; // 5
            4'h6: SEG = 7'b0000010; // 6
            4'h7: SEG = 7'b1111000; // 7
            4'h8: SEG = 7'b0000000; // 8
            4'h9: SEG = 7'b0010000; // 9
            4'hA: SEG = 7'b0001000; // a
            4'hB: SEG = 7'b0000011; // b
            4'hC: SEG = 7'b1000110; // c
            4'hD: SEG = 7'b0100001; // d
            4'hE: SEG = 7'b0000110; // e
            4'hF: SEG = 7'b0001110; // f
            default: SEG = 7'b1111111; // off
        endcase
    end
endmodule
