`timescale 1ns / 1ps

module barrel_shifter16(
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,
    input wire rotate,
    output wire [15:0] data_out
);

    wire [15:0] stage [0:4];
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : STAGES
            wire [15:0] current_data = stage[i];

            wire [15:0] logical_left  = current_data << (1 << i);
            wire [15:0] logical_right = current_data >> (1 << i);

            wire [15:0] rotate_left  = {current_data[15 - (1 << i):0], current_data[15:16 - (1 << i)]};
            wire [15:0] rotate_right = {current_data[(1 << i) - 1:0], current_data[15:(1 << i)]};

            wire [15:0] left_result  = rotate ? rotate_left : logical_left;
            wire [15:0] right_result = rotate ? rotate_right : logical_right;

            wire [15:0] shifted_data = (dir == 1'b0) ? left_result : right_result;

            assign stage[i + 1] = shamt[i] ? shifted_data : current_data;
        end
    endgenerate

    assign data_out = stage[4];

endmodule
