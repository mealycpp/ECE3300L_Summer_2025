`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 12:54:07 AM
// Design Name: 
// Module Name: 7_seg_scan
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


module seven_seg_scan(
    input clk,
    input [3:0] ctrl_nibble,
    input [7:0] result,
    output reg [7:0] AN,
    output reg [6:0] SEG
    );

    reg [19:0] switch = 0;
    // reg [1:0] switch = 2'b00;
    wire [1:0] select;

    always @(posedge clk) begin
        switch <= switch + 1;
    end

    assign select = switch[19:18];
    // assign select = switch[1:0];

    reg [3:0] digit;
    
    always @(*) begin
        case (select)
            2'b00: begin
               AN = 8'b11111110;
               digit = result[3:0]; 
            end
            2'b01: begin
               AN <= 8'b11111101;
               digit = result[7:4]; 
            end
            2'b10: begin
               AN = 8'b11111011;
               digit <= ctrl_nibble; 
            end
            default: begin
                AN = 8'b00000111;
                digit = 4'd0;
            end
        endcase 
        case (digit)
            4'd0: SEG <= 7'b1000000;
            4'd1: SEG <= 7'b1111001;
            4'd2: SEG <= 7'b0100100;
            4'd3: SEG <= 7'b0110000;
            4'd4: SEG <= 7'b0011001;
            4'd5: SEG <= 7'b0010010;
            4'd6: SEG <= 7'b0000010;
            4'd7: SEG <= 7'b1111000;
            4'd8: SEG <= 7'b0000000;
            4'd9: SEG <= 7'b0010000;
            4'd10: SEG <= 7'b0001000;
            4'd11: SEG <= 7'b0000011;
            4'd12: SEG <= 7'b1000110;
            4'd13: SEG <= 7'b0100001;
            4'd14: SEG <= 7'b0000110;
            4'd15: SEG <= 7'b0001110;
            default: SEG <= 7'b1111111; 
        endcase
    end

endmodule
