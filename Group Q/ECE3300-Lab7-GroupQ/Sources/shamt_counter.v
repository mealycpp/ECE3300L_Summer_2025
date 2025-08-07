`timescale 1ns / 1ps

module shamt_counter(
                     input wire clk,
                     input BTNC,
                     output reg [1:0] shamt_hi
                    );
                    
                    reg btnc_last = 0;
                    always @(posedge clk) begin
                        btnc_last <= BTNC;
                        if (BTNC & ~btnc_last)
                            shamt_hi <= shamt_hi + 1;
                    end
endmodule
