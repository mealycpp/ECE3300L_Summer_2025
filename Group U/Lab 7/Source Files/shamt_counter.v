`timescale 1ns / 1ps

module shamt_counter(
    input wire clk,          // any suitable slow clock (e.g., clk_demo)
    input wire rst,          // active-high reset
    input wire inc,          // increment signal (debounced BTNC toggle)
    output reg [1:0] shamt_high = 2'b00  // shamt[3:2]
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            shamt_high <= 2'b00;
        else if (inc)
            shamt_high <= shamt_high + 1;
    end

endmodule
