//bryan

module seg7_scan(
    input clk,
    input rst_n,
    input [7:0] result,
    input [3:0] ctrl,
    output reg [6:0] seg,
    output reg [2:0] an
);
    reg [1:0] digit_sel;
    reg [3:0] digit;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            digit_sel <= 0;
        else
            digit_sel <= digit_sel + 1;
    end

    always @(*) begin
        case (digit_sel)
            2'd0: begin digit = result[3:0]; an = 3'b110; end
            2'd1: begin digit = result[7:4]; an = 3'b101; end
            2'd2: begin digit = ctrl;        an = 3'b011; end
            default: begin digit = 0;        an = 3'b111; end
        endcase

        case (digit)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
