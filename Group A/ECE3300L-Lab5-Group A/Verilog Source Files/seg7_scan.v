`timescale 1ns / 1ps

module seg7_scan(
    input clk,                    
    input rst_n,                  
    input [3:0] digit0, digit1,   
    output reg [6:0] seg,         
    output reg [7:0] an           
);
    reg [19:0] refresh_counter;
    wire sel = refresh_counter[19];

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    wire [3:0] digit = sel ? digit1 : digit0;

    always @(digit) begin
        case (digit)
            4'd0: seg = 7'b0000001;
            4'd1: seg = 7'b1001111;
            4'd2: seg = 7'b0010010;
            4'd3: seg = 7'b0000110;
            4'd4: seg = 7'b1001100;
            4'd5: seg = 7'b0100100;
            4'd6: seg = 7'b0100000;
            4'd7: seg = 7'b0001111;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0001100;
            default: seg = 7'b1111111;
        endcase
    end

    always @(sel) begin
        case (sel)
            1'b0: an = 8'b11111110;
            1'b1: an = 8'b11111101;
        endcase
    end
endmodule
