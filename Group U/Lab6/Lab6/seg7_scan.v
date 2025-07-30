module seg7_scan(
    input clk,
    input [7:0] result,
    input [3:0] ctrl_nibble,
    output reg [6:0] SEG,
    output reg [7:0] AN
);

    reg [16:0] digit_scan_counter;
    wire [1:0] digit_mux;
    reg [3:0] value;

    always @(posedge clk)
        digit_scan_counter <= digit_scan_counter + 1;

    assign digit_mux = digit_scan_counter[16:15];

    always @(*) begin
        case (digit_mux)
            2'b00: begin
                value = result[3:0];
                AN = 8'b11111110;
            end
            2'b01: begin
                value = result[7:4];
                AN = 8'b11111101;
            end
            2'b10: begin
                value = ctrl_nibble;
                AN = 8'b11111011;
            end
            default: begin
                value = 4'b0000;
                AN = 8'b11111111;
            end
        endcase
    end

    always @(*) begin
        case (value)
            4'h0: SEG = 7'b1000000;
            4'h1: SEG = 7'b1111001;
            4'h2: SEG = 7'b0100100;
            4'h3: SEG = 7'b0110000;
            4'h4: SEG = 7'b0011001;
            4'h5: SEG = 7'b0010010;
            4'h6: SEG = 7'b0000010;
            4'h7: SEG = 7'b1111000;
            4'h8: SEG = 7'b0000000;
            4'h9: SEG = 7'b0010000;
            4'hA: SEG = 7'b0001000;
            4'hB: SEG = 7'b0000011;
            4'hC: SEG = 7'b1000110;
            4'hD: SEG = 7'b0100001;
            4'hE: SEG = 7'b0000110;
            4'hF: SEG = 7'b0001110;
            default: SEG = 7'b1111111;
        endcase
    end
endmodule
