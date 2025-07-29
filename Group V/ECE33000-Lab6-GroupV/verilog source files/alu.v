`timescale 1ns / 1ps

module alu(
input [3:0]A,
input [3:0]B,
input [1:0]CTRL,
output reg[7:0]RESULT
    );
//mux to choose which math to do
always @(*) begin
    case (CTRL)
        2'b00: begin
            RESULT = A + B; //normal addition
        end

        2'b01: begin
            if (A > B)
                RESULT = A - B; //normal subtraction
            else
                RESULT = A + 18 - B; //rollover, if A-B is less than zero, it will rollover by adding 18 as a "reset"
        end

        default: begin
            RESULT = 0;
        end
    endcase
end

endmodule
