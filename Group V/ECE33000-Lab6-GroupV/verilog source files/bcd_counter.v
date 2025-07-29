`timescale 1ns / 1ps

module bcd_counter(
input clk_div,
input BTN0,//rst_n,
input dir_bit,//sw7 or sw8 (instantiated twice),
output reg[4:0]BCD
);
//rst_n low output = 0
//each rising edge of clk_div, dir = 1, inc, else dec

always @ (posedge clk_div or negedge BTN0) begin

    if (!BTN0)begin 
        BCD <= 0;
    end else begin
        if (dir_bit) begin // counting up
            if (BCD == 9) 
                BCD <= 0;
            else 
                BCD <= BCD + 1;
        end else begin
            if (BCD == 0)
                BCD <= 9;
            else
                BCD <= BCD - 1;
            end
        end 
    end

endmodule