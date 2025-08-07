module barrel_shifter16(
    input wire [15:0] data_in,                                                                  // 16-bit input data
    input wire [3:0] shamt,                                                                     // 4-bit shift amount
    input wire dir,                                                                             // shift direction: 1 = right, 0 = left
    input wire rotate,                                                                          // 1 = rotate, 0 = logical shift
    output wire [15:0] data_out                                                                 // 16-bit shifted output
);
    wire [15:0] s_stage1, s_stage2, s_stage3, s_stage4;                                         // Intermediate wires for staged shifting

    // shift/rotate by 1
    assign s_stage1 = (shamt[0]) ?                                                              
        (rotate ? (dir ? {data_in[0], data_in[15:1]} : {data_in[14:0], data_in[15]}) :
                  (dir ? {1'b0, data_in[15:1]}       : {data_in[14:0], 1'b0})) :
        data_in;

    // shift/rotate by 2
    assign s_stage2 = (shamt[1]) ?
        (rotate ? (dir ? {s_stage1[1:0], s_stage1[15:2]} : {s_stage1[13:0], s_stage1[15:14]}) :
                  (dir ? {2'b00, s_stage1[15:2]}         : {s_stage1[13:0], 2'b00})) :
        s_stage1;

    // shift/rotate by 4
    assign s_stage3 = (shamt[2]) ?
        (rotate ? (dir ? {s_stage2[3:0], s_stage2[15:4]} : {s_stage2[11:0], s_stage2[15:12]}) :
                  (dir ? {4'b0000, s_stage2[15:4]}       : {s_stage2[11:0], 4'b0000})) :
        s_stage2;

    // shift/rotate by 8
    assign s_stage4 = (shamt[3]) ?
        (rotate ? (dir ? {s_stage3[7:0], s_stage3[15:8]} : {s_stage3[7:0], s_stage3[15:8]}) :
                  (dir ? {8'b00000000, s_stage3[15:8]}   : {s_stage3[7:0], 8'b00000000})) :
        s_stage3;

    assign data_out = s_stage4;                                                                 // Final shifted/rotated result
endmodule