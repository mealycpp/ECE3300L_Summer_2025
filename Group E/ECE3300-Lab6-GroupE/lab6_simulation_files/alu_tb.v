module alu (
    input [3:0] A,  // Units BCD
    input [3:0] B,  // Tens BCD
    input [1:0] ctrl, // 00 = add, 01 = sub
    output reg [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;
            2'b01: result = A - B;
            default: result = 0;
        endcase
    end
endmodule
