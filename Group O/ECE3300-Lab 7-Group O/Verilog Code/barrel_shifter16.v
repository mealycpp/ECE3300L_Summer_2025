`timescale 1ns / 1ps
module barrel_shifter16(
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,  
    input wire rotate,   
    output wire [15:0] data_out
);
    wire [15:0] stage[4:0];
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : stages
            wire [15:0] in = stage[i];
            wire [15:0] shifted;

            if (dir == 1'b0) begin
                assign shifted = rotate ?
                    {in[15 - (1<<i):0], in[15:16 - (1<<i)]} :
                    {in[15 - (1<<i):0], {(1<<i){1'b0}}};
            end else begin
                assign shifted = rotate ?
                    {in[(1<<i)-1:0], in[15:(1<<i)]} :
                    {{(1<<i){1'b0}}, in[15:(1<<i)]};
            end

            assign stage[i+1] = shamt[i] ? shifted : in;
        end
    endgenerate

    assign data_out = stage[4];
endmodule
