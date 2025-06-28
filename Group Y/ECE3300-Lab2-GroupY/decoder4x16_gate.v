module decoder4x16_gate (
    input [4:0] sw,
    output [15:0] led
);

    assign led[0]  = sw[4] & ~sw[3] & ~sw[2] & ~sw[1] & ~sw[0]; //0000
    assign led[1]  = sw[4] & ~sw[3] & ~sw[2] & ~sw[1] &  sw[0]; //0001
    assign led[2]  = sw[4] & ~sw[3] & ~sw[2] &  sw[1] & ~sw[0]; //0010
    assign led[3]  = sw[4] & ~sw[3] & ~sw[2] &  sw[1] &  sw[0];
    assign led[4]  = sw[4] & ~sw[3] &  sw[2] & ~sw[1] & ~sw[0];
    assign led[5]  = sw[4] & ~sw[3] &  sw[2] & ~sw[1] &  sw[0];
    assign led[6]  = sw[4] & ~sw[3] &  sw[2] &  sw[1] & ~sw[0];
    assign led[7]  = sw[4] & ~sw[3] &  sw[2] &  sw[1] &  sw[0];
    assign led[8]  = sw[4] &  sw[3] & ~sw[2] & ~sw[1] & ~sw[0];
    assign led[9]  = sw[4] &  sw[3] & ~sw[2] & ~sw[1] &  sw[0];
    assign led[10] = sw[4] &  sw[3] & ~sw[2] &  sw[1] & ~sw[0];
    assign led[11] = sw[4] &  sw[3] & ~sw[2] &  sw[1] &  sw[0];
    assign led[12] = sw[4] &  sw[3] &  sw[2] & ~sw[1] & ~sw[0];
    assign led[13] = sw[4] &  sw[3] &  sw[2] & ~sw[1] &  sw[0];
    assign led[14] = sw[4] &  sw[3] &  sw[2] &  sw[1] & ~sw[0];
    assign led[15] = sw[4] &  sw[3] &  sw[2] &  sw[1] &  sw[0]; //1111

endmodule