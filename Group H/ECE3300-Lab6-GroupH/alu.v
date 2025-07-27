`timescale 1ns / 1ps

module alu (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [1:0] ctrl,
    output reg  [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = {4'd0, A} + {4'd0, B};   // unsigned add  (0-18)
            2'b01: result = {4'd0, A} - {4'd0, B};   // unsigned sub, wrap
            default: result = 8'd0;                  // other ops reserved
        endcase
    end
endmodule