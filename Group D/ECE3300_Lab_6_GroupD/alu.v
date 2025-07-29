//bryan

module alu(input [3:0] A, input [3:0] B, input [1:0] ctrl, output reg [7:0] result);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;
            2'b01: result = A - B;
            default: result = 8'd0;
        endcase
    end
endmodule
