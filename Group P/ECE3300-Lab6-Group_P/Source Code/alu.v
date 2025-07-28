`timescale 1ns / 1ps
module alu(
    input wire [3:0] A_val,                     // 4-bit input A
    input wire [3:0] B_val,                     // 4-bit input B
    input wire [1:0] control_bits,              // 2-bit control input to select operation
    output reg [7:0] result_out                 // 8-bit result output to capture overflow
);
    always @(*) begin
        case (control_bits)
            2'b00: result_out = A_val + B_val;  // ADD
            2'b01: result_out = A_val - B_val;  // SUB
            default: result_out = 8'd0;         // Default case: output zero for unsupported control values
        endcase
    end
endmodule
