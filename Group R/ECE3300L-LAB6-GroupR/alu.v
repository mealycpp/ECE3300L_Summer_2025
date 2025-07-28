`timescale 1ns / 1ps
//////////////////////////////////////////////////////////


module alu(
    input [3:0] A,
    input [3:0] B,
    input [1:0] ctrl,          // SW[6:5]
    output reg [7:0] result
    );
    
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;         // Add (0-18)
            2'b01: result = A - B;        // Subtract (wrap)
            default: result = 8'h00;
        endcase
    end    
endmodule
