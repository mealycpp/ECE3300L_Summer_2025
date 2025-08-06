`timescale 1ns / 1ps

module shamt_counter(
                     input wire clk,
                     input btnc,
                     output reg [1:0] shamt_high
                    );
                    
                    reg btnc_last = 0;
                    always @(posedge clk) begin
                        btnc_last <= btnc;
                        if (btnc & ~btnc_last)
                            shamt_high <= shamt_high + 1;
                    end
endmodule
