`timescale 1ns / 1ps

module decoder4x16_behav (
    input  wire [3:0] A,
    input  wire       E,
    output reg  [15:0] Y
);

// [GREEN] reset outputs every combinational evaluation
always @(*) begin
    Y = 16'b0;

    // [BLUE] decode only when enabled
    if (E) begin
        // [ORANGE] mapping a to y[i]
        case (A)
            4'b0000: Y = 16'b0000_0000_0000_0001; // Y0
            4'b0001: Y = 16'b0000_0000_0000_0010; // Y1
            4'b0010: Y = 16'b0000_0000_0000_0100; // Y2
            4'b0011: Y = 16'b0000_0000_0000_1000; // Y3
            4'b0100: Y = 16'b0000_0000_0001_0000; // Y4
            4'b0101: Y = 16'b0000_0000_0010_0000; // Y5
            4'b0110: Y = 16'b0000_0000_0100_0000; // Y6
            4'b0111: Y = 16'b0000_0000_1000_0000; // Y7
            4'b1000: Y = 16'b0000_0001_0000_0000; // Y8
            4'b1001: Y = 16'b0000_0010_0000_0000; // Y9
            4'b1010: Y = 16'b0000_0100_0000_0000; // Y10
            4'b1011: Y = 16'b0000_1000_0000_0000; // Y11
            4'b1100: Y = 16'b0001_0000_0000_0000; // Y12
            4'b1101: Y = 16'b0010_0000_0000_0000; // Y13
            4'b1110: Y = 16'b0100_0000_0000_0000; // Y14
            4'b1111: Y = 16'b1000_0000_0000_0000; // Y15
            default: Y = 16'b0;
        endcase
    end
end
endmodule
