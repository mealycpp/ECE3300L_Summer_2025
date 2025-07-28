`timescale 1ns / 1ps
module alu(
input wire [4:0] A,
input wire [4:0] B,
input wire [1:0] ctrl,
output reg [7:0] out 
    );
 always @(*) begin
        case (ctrl)
            2'b00: begin
                // ADD
                 out = A + B;
            end
            2'b01: begin
                // SUB with wraparound
                if (A >= B)
                    out = A - B;
                else
                   out  = (A + 4'd10) - B;
            end
            default: begin
                out = 8'd0;
            end
        endcase
    end

endmodule
