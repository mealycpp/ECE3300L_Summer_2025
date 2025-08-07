//jaden

module barrel_shifter16(
    input [15:0] data_in,
    input [3:0] shamt,
    input dir,         // 0 = left, 1 = right
    input rotate,      // 0 = logical, 1 = rotate
    output reg [15:0] data_out
);
    always @(*) begin
        if (!rotate) begin
            data_out = (dir == 0) ? (data_in << shamt) : (data_in >> shamt);
        end else begin
            case (shamt)
                4'd0:  data_out = data_in;
                default: data_out = (dir == 0) ?
                    ((data_in << shamt) | (data_in >> (16 - shamt))) :
                    ((data_in >> shamt) | (data_in << (16 - shamt)));
            endcase
        end
    end
endmodule
