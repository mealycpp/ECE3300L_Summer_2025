`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: alu
// Description: A 4-bit ALU that adds or subtracts two inputs.
//              - ctrl = 00: result = A + B
//              - ctrl = 01: result = A - B
//////////////////////////////////////////////////////////////////////////////////

module alu(
    input [3:0] A,          // Input A (from units counter)
    input [3:0] B,          // Input B (from tens counter)
    input [1:0] ctrl,       // ALU operation control from SW[6:5]
    output reg [7:0] result // 8-bit result for display
    );

    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;       // Addition 
            2'b01: result = A - B;       // Subtraction (with 2's complement wrap-around) [cite: 64]
            default: result = 8'h00;     // Default to zero [cite: 65]
        endcase
    end

endmodule