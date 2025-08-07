module hex_to_7seg(
    input wire [3:0] HEX,
    output reg [6:0] SEG
);
    always @(*) begin
        case (HEX)
            4'h0: SEG = 7'b1000000; // 0
            4'h1: SEG = 7'b1111001; // 1
            4'h2: SEG = 7'b0100100; // 2
            4'h3: SEG = 7'b0110000; // 3
            4'h4: SEG = 7'b0011001; // 4
            4'h5: SEG = 7'b0010010; // 5
            4'h6: SEG = 7'b0000010; // 6
            4'h7: SEG = 7'b1111000; // 7
            4'h8: SEG = 7'b0000000; // 8
            4'h9: SEG = 7'b0011000; // 9
            4'hA: SEG = 7'b0001000; // A
            4'hB: SEG = 7'b0000011; // b
            4'hC: SEG = 7'b1000110; // C
            4'hD: SEG = 7'b0100001; // d
            4'hE: SEG = 7'b0000110; // E
            4'hF: SEG = 7'b0001110; // F
            default: SEG = 7'b1111111; // Blank;
        endcase
    end
endmodule
