`timescale 1ns / 1ps
module bcd_counter(
    input clk_div,
    input BTN0,
    input dir_bit, 
    output reg [3:0] BCD 
    );
    always @(posedge clk_div or negedge BTN0) begin
        if (!BTN0) begin
        //resetbcd value
            BCD <= 4'd0; 
        end else begin
            if (dir_bit) begin 
                if (BCD == 4'd9) begin 
                    BCD <= 4'd0;
                end else begin
                    BCD <= BCD + 4'd1;
                end
            end else begin 
                if (BCD == 4'd0) begin 
                    BCD <= 4'd9;
                end else begin
                    BCD <= BCD - 4'd1;
                end
            end
        end
    end
endmodule
