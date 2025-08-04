`timescale 1ns / 1ps
module shamt_counter(
    input wire clk,               
    output reg [1:0] shamt_high   
);

    always @(posedge clk) begin
        shamt_high <= shamt_high + 1;
    end

endmodule
