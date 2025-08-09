`timescale 1ns / 1ps

module barrel_shifter16(
    input  wire [15:0] data_in,
    input  wire [3:0]  shamt,   // shift amount (0–15)
    input  wire        dir,     // 0 = left, 1 = right
    input  wire        rotate,  // 0 = logical shift, 1 = rotate
    output wire [15:0] data_out
);

    wire [15:0] stage [4:0];  // stage[0] is input, stage[4] is final output
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_stage
            wire [15:0] shift_result;
            wire [3:0]  amt = 4'b0001 << i; // shift amount: 1, 2, 4, 8

            assign shift_result = (dir == 1'b0) ?   // Left shift
                (rotate ?
                    {stage[i][15-amt[3:0]:0], stage[i][15:16-amt[3:0]]} :
                    {stage[i][15-amt[3:0]:0], {amt{1'b0}}}
                ) :
                (rotate ?
                    {stage[i][amt[3:0]-1:0], stage[i][15:amt[3:0]]} :
                    {{amt{1'b0}}, stage[i][15:amt[3:0]]}
                );

            assign stage[i+1] = shamt[i] ? shift_result : stage[i];
        end
    endgenerate

    assign data_out = stage[4];

endmodule
