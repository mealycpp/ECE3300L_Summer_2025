`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 02:56:20 AM
// Design Name: 
// Module Name: seg7scan8
// Project Name: seg7scan8
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


module seg7scan8(
    input wire clk,
    input wire rst_n,
    input wire [3:0] onesP,
    input wire [3:0] tensP,
    input wire [3:0] hundredsP,
    input wire [3:0] thousandsP,
    output wire [6:0] SEG,
    output reg [7:0] AN
);
    
    reg [19:0] counter_ref = 0;
    wire [1:0] sel;
    reg [3:0] digit;
    wire [6:0] seg;
    assign SEG = seg;
    assign sel = counter_ref[19:18];

    always @(posedge clk or negedge rst_n) 
        begin
            if (!rst_n)
                counter_ref <= 0;
            else
                counter_ref <= counter_ref + 1;
        end

    always @(*) 
        begin
            case(sel)
                2'd0: 
                    begin
                        AN = 8'b11111110;
                        digit = onesP;
                    end
                2'd1: 
                    begin
                        AN = 8'b11111101;
                        digit = tensP;
                    end
                2'd2:
                    begin
                        AN = 8'b11111011;
                        digit = hundredsP;
                    end 
                2'd3:
                    begin
                        AN = 8'b11110111;
                        digit = thousandsP;
                    end 
                default: AN = 8'b11111111;
            endcase
        end

   hex_to_7seg decoder (
        .digit(digit),
        .SEG(seg)
    );

endmodule