`timescale 1ns / 1ps

module decoder4x16_behav(
    input  [3:0] A,
    input        E,
    output reg [15:0] Y
);

always @(*) begin
    Y = 16'b0;                 // ▶ RESET: clear all outputs to 0
    if (E) begin               // ▶ ENABLE: only decode when enabled
        case (A)
            4'b0000: Y = 16'b0000_0000_0000_0001; // ▶ OUTPUT: activate Y[0]
            4'b0001: Y = 16'b0000_0000_0000_0010; // ▶ OUTPUT: activate Y[1]
            4'b0010: Y = 16'b0000_0000_0000_0100; // ▶ OUTPUT: activate Y[2]
            4'b0011: Y = 16'b0000_0000_0000_1000; // ▶ OUTPUT: activate Y[3]
            4'b0100: Y = 16'b0000_0000_0001_0000; // ▶ OUTPUT: activate Y[4]
            4'b0101: Y = 16'b0000_0000_0010_0000; // ▶ OUTPUT: activate Y[5]
            4'b0110: Y = 16'b0000_0000_0100_0000; // ▶ OUTPUT: activate Y[6]
            4'b0111: Y = 16'b0000_0000_1000_0000; // ▶ OUTPUT: activate Y[7]
            4'b1000: Y = 16'b0000_0001_0000_0000; // ▶ OUTPUT: activate Y[8]
            4'b1001: Y = 16'b0000_0010_0000_0000; // ▶ OUTPUT: activate Y[9]
            4'b1010: Y = 16'b0000_0100_0000_0000; // ▶ OUTPUT: activate Y[10]
            4'b1011: Y = 16'b0000_1000_0000_0000; // ▶ OUTPUT: activate Y[11]
            4'b1100: Y = 16'b0001_0000_0000_0000; // ▶ OUTPUT: activate Y[12]
            4'b1101: Y = 16'b0010_0000_0000_0000; // ▶ OUTPUT: activate Y[13]
            4'b1110: Y = 16'b0100_0000_0000_0000; // ▶ OUTPUT: activate Y[14]
            4'b1111: Y = 16'b1000_0000_0000_0000; // ▶ OUTPUT: activate Y[15]
        endcase
    end
end

endmodule
