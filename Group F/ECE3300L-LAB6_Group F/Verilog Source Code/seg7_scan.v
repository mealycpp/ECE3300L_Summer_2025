module seg7_scan(
    input wire clk,                    // 100 MHz clock
    input wire [7:0] result,           // ALU result
    input wire [3:0] ctrl_nibble,      // Control bits
    output reg [2:0] AN,               // Active low digit enables
    output reg [6:0] SEG               // Segments (a–g)
);

    reg [15:0] scan_cnt = 0;
    reg [1:0] digit_idx = 0;
    reg [3:0] value;

    // Scan timing ~1kHz (assuming 100 MHz clock)
    always @(posedge clk) begin
        if (scan_cnt == 16'd49999) begin // 100MHz/1kHz/3 = 33333, using 50000 for simplicity
            scan_cnt <= 0;
            digit_idx <= digit_idx + 1;
        end else begin
            scan_cnt <= scan_cnt + 1;
        end
    end

    always @(*) begin
        case (digit_idx)
            2'd0: begin AN = 3'b110; value = result[3:0]; end // AN0 = display result low nibble
            2'd1: begin AN = 3'b101; value = result[7:4]; end // AN1 = display result high nibble
            2'd2: begin AN = 3'b011; value = ctrl_nibble; end // AN2 = display control nibble
            default: begin AN = 3'b111; value = 4'd0; end
        endcase
    end

    // 7-segment decoder for common anode (active low)
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
