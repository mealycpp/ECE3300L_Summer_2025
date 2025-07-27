`timescale 1ns / 1ps

module alu(
    input [3:0] A,
    input [3:0] B,  
    input [1:0] ctrl,
    output reg [7:0] result
    );
    
    always @(*) begin
    if (ctrl == 2'b00)
        result = A + B;
    else if (ctrl == 2'b01)
        result = A - B;
    else
        result = 8'd0;
end
    
    
endmodule
