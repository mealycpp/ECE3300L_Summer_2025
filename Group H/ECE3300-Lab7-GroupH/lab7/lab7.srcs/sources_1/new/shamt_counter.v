`timescale 1ns / 1ps
module shamt_counter(
    input wire clk_1kHz,     
    input wire btn_tick,      
    output reg [1:0] shamt_high = 2'b00
);
    always @(posedge clk_1kHz) begin
        if (btn_tick) begin
            shamt_high <= shamt_high + 1;
        end
    end
endmodule
