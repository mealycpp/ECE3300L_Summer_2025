module seg7_scan(
    input clk,
    input rst_n,
    input [3:0] digit0, digit1, digit2,
    output reg [7:0] an,
    output reg [6:0] seg
);
    reg [19:0] scan_count;
    wire [1:0] sel;
    reg [3:0] current_digit;

    assign sel = scan_count[19:18]; 

    always @(posedge clk or negedge rst_n)
        if (!rst_n) scan_count <= 0;
        else scan_count <= scan_count + 1;

    always @(*) begin
        case (sel)
            2'b00: begin
                an = 8'b1111_1110;    // AN0 active
                current_digit = digit0;
            end
            2'b01: begin
                an = 8'b1111_1101;    // AN1 active
                current_digit = digit1;
            end
            2'b10: begin
                an = 8'b1111_1011;    // AN2 active
                current_digit = digit2;
            end
            default: begin
                an = 8'b1111_1111;    // Disable all
                current_digit = 4'b0000;
            end
        endcase
    end

    always @(*) begin
        case (current_digit)
            4'd0:  seg = 7'b1000000; // 0
            4'd1:  seg = 7'b1111001; // 1
            4'd2:  seg = 7'b0100100; // 2
            4'd3:  seg = 7'b0110000; // 3
            4'd4:  seg = 7'b0011001; // 4
            4'd5:  seg = 7'b0010010; // 5
            4'd6:  seg = 7'b0000010; // 6
            4'd7:  seg = 7'b1111000; // 7
            4'd8:  seg = 7'b0000000; // 8
            4'd9:  seg = 7'b0010000; // 9
            4'd10: seg = 7'b0001000; // A
            4'd11: seg = 7'b0000011; // b
            4'd12: seg = 7'b1000110; // C
            4'd13: seg = 7'b0100001; // d
            4'd14: seg = 7'b0000110; // E
            4'd15: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // Blank
        endcase
    end
endmodule
