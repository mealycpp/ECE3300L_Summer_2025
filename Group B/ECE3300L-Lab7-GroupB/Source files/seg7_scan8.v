module seg7_scan8 (
    input wire clk_1kHz,
    input wire rst_n,
    input wire [6:0] seg0, seg1, seg2, seg3, // 4 digit segments
    output reg [6:0] seg,                   // active segment pattern
    output reg [7:0] an                     // anode control
);
    reg [1:0] digit_index;

    always @(posedge clk_1kHz or negedge rst_n) begin
        if (!rst_n)
            digit_index <= 0;
        else
            digit_index <= digit_index + 1;
    end

    always @(*) begin
        // Default: all digits off
        an  = 8'b1111_1111;
        seg = 7'b1111111;

        case (digit_index)
            2'b00: begin
                an  = 8'b1111_1110; // AN0 active
                seg = seg0;
            end
            2'b01: begin
                an  = 8'b1111_1101; // AN1 active
                seg = seg1;
            end
            2'b10: begin
                an  = 8'b1111_1011; // AN2 active
                seg = seg2;
            end
            2'b11: begin
                an  = 8'b1111_0111; // AN3 active
                seg = seg3;
            end
        endcase
    end
endmodule
