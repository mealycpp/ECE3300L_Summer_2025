module alu (
    input wire [3:0] A,         // units BCD
    input wire [3:0] B,         // tens BCD
    input wire [1:0] ctrl,      // {SW6, SW5}
    output reg [7:0] result
);
    always @(*) begin
        case (ctrl)
            2'b00: result = A + B;                    // Add (0–18)
            2'b01: result = (A >= B) ? (A - B) : ((A + 10) - B); // Subtract, wrap if underflow
            default: result = 8'd0;
        endcase
    end
endmodule
