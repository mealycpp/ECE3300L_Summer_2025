module alu(
    input [3:0] A, B,
    input [1:0] ctrl,
    output reg [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;       // ADD
            2'b01: result = A - B;       // SUB
            2'b10: result = B - A;       // Reverse SUB
            2'b11: result = A + B + 4'd1; 
            default: result = 8'd0;
        endcase
    end
endmodule
