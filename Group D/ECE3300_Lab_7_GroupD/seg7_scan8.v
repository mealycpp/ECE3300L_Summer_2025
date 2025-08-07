//bryan

module seg7_scan8(
    input clk,
    input [3:0] hex0, hex1, hex2, hex3,
    output reg [6:0] seg,
    output reg [7:0] an
);
    reg [1:0] scan = 0;
    wire [3:0] selected;

    always @(posedge clk)
        scan <= scan + 1;

    assign selected = (scan == 2'b00) ? hex0 :
                      (scan == 2'b01) ? hex1 :
                      (scan == 2'b10) ? hex2 : hex3;

    hex_to_7seg hex_disp(.hex(selected), .seg(seg));

    always @(*) begin
        an = 8'b11111111;
        case (scan)
            2'b00: an[0] = 0;
            2'b01: an[1] = 0;
            2'b10: an[2] = 0;
            2'b11: an[3] = 0;
        endcase
    end
endmodule
