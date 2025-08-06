`timescale 1ns / 1ps

module seg7_scan8(
    input wire clk,
    input wire rst_n,
    input wire [3:0] onesPlace,
    input wire [3:0] tensPlace,
    input wire [3:0] hundredsPlace,
    input wire [3:0] thousandsPlace,
    output wire [6:0] SEG,
    output reg [7:0] AN
);
    
    reg [19:0] refresh_counter = 0;
    wire [1:0] sel;
    reg [3:0] digit_val;
    wire [6:0] seg_val;
    assign SEG = seg_val;
    assign sel = refresh_counter[19:18];

    always @(posedge clk or negedge rst_n) 
        begin
            if (!rst_n)
                refresh_counter <= 0;
            else
                refresh_counter <= refresh_counter + 1;
        end

    always @(*) 
        begin
            case(sel)
                2'd0: 
                    begin
                        AN = 8'b11111110;
                        digit_val = onesPlace;
                    end
                2'd1: 
                    begin
                        AN = 8'b11111101;
                        digit_val = tensPlace;
                    end
                2'd2:
                    begin
                        AN = 8'b11111011;
                        digit_val = hundredsPlace;
                    end 
                2'd3:
                    begin
                        AN = 8'b11110111;
                        digit_val = thousandsPlace;
                    end 
                default: AN = 8'b11111111;
            endcase
        end

   hex_to_7seg decoder (
        .digitVal(digit_val),
        .SEG(seg_val)
    );

endmodule
