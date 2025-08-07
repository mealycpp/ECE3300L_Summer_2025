module barrel_shifter16(
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,
    input wire rotate,
    output wire [15:0] data_out
);
    wire [15:0] stage [4:0];
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin: shift_stage
            wire [15:0] shifted;
            assign shifted = dir ?
                (rotate ? {stage[i][(1<<i)-1:0], stage[i][15:(1<<i)]} : { {1<<i{1'b0}}, stage[i][15:(1<<i)] }) :
                (rotate ? {stage[i][15-(1<<i):0], stage[i][15:16-(1<<i)]} : {stage[i][15-(1<<i):0], {1<<i{1'b0}} });
            assign stage[i+1] = shamt[i] ? shifted : stage[i];
        end
    endgenerate

    assign data_out = stage[4];
endmodule


