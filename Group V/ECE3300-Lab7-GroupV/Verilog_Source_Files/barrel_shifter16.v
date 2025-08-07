`timescale 1ns / 1ps
module barrel_shifter16(
    input [15:0] data_in,
    input [3:0] shamt,
    input dir,
    input rotate,
    output reg [15:0] data_out
);
    wire [15:0] stage0, stage1, stage2, stage3;

    //if rotate is high then we wrap, if not then we do a logical shift
    assign stage0 = (shamt[0]) ? (dir ?                                            //activate if shamt == 0
        (rotate ? {data_in[0], data_in[15:1]} : {1'b0, data_in[15:1]}) :           //right shift
        (rotate ? {data_in[14:0], data_in[15]} : {data_in[14:0], 1'b0})) : data_in;//left shift

    assign stage1 = (shamt[1]) ? (dir ?                                             //activate if shamt ==1
        (rotate ? {stage0[1:0], stage0[15:2]} : {2'b00, stage0[15:2]}) :            //right shift
        (rotate ? {stage0[13:0], stage0[15:14]} : {stage0[13:0], 2'b00})) : stage0; //left shift

    assign stage2 = (shamt[2]) ? (dir ?                                               //activate if shamt == 2
        (rotate ? {stage1[3:0], stage1[15:4]} : {4'b0000, stage1[15:4]}) :            //right shift
        (rotate ? {stage1[11:0], stage1[15:12]} : {stage1[11:0], 4'b0000})) : stage1; //left shift

    assign stage3 = (shamt[3]) ? (dir ?                                                //activate if shamt == 3
        (rotate ? {stage2[7:0], stage2[15:8]} : {8'b00000000, stage2[15:8]}) :        //right shift
        (rotate ? {stage2[7:0], stage2[15:8]} : {stage2[7:0], 8'b00000000})) : stage2;//left shift

    always @(*) begin
        data_out = stage3;
    end
endmodule