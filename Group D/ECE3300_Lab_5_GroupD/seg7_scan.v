// bryan

module seg7_scan (
    input clk,
    input [3:0] digit0, digit1,
    output reg [6:0] seg,
    output reg [1:0] an
);
    reg [15:0] div;
    always @(posedge clk) div <= div + 1;

    wire sel = div[15];
    always @(*) begin
        an = sel ? 2'b10 : 2'b01;
        case (sel ? digit1 : digit0)
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
