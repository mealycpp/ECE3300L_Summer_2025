`timescale 1ns / 1ps
module alu(
  input [3:0] A, //ones 
    input [3:0] B,  // tens
    input [1:0] ctrl, // SW[6:5]
    output reg [7:0] result
    );
    reg [4:0] computation;

    always @(*) begin
    if (ctrl == 2'b00)
        computation = A + B; // addition
    else if (ctrl == 2'b01)
        computation = A - B; // subtraction
    else
        computation = 8'd0;

        result[7:5] = 0; 
        result[4] = computation / 4'd10; 
        result[3:0] = computation % 4'd10;
end


endmodule
