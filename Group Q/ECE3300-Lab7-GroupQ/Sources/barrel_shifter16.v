module barrel_shifter16(
    input  [15:0] data_in,
    input  [3:0]  shamt,
    input         dir,    // 0 = left, 1 = right
    input         rotate, // 0 = logical, 1 = rotate
    output [15:0] data_out
);
    reg [15:0] temp;
    always @(*) begin
        if (dir == 0) begin
            if (rotate)
                temp = (data_in << shamt) | (data_in >> (16 - shamt));
            else
                temp = data_in << shamt;
        end else begin
            if (rotate)
                temp = (data_in >> shamt) | (data_in << (16 - shamt));
            else
                temp = data_in >> shamt;
        end
    end
    assign data_out = temp;
endmodule