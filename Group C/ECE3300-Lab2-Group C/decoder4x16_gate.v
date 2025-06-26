module decoder4x16_gate (
    input wire [3:0] A,
    input wire E,
    output wire [15:0] Y
);
    // Each line sets one output high when E is enabled and A matches the index
    assign Y[0]  = E & ~A[3] & ~A[2] & ~A[1] & ~A[0];
    assign Y[1]  = E & ~A[3] & ~A[2] & ~A[1] &  A[0];
    assign Y[2]  = E & ~A[3] & ~A[2] &  A[1] & ~A[0];
    assign Y[3]  = E & ~A[3] & ~A[2] &  A[1] &  A[0];
    assign Y[4]  = E & ~A[3] &  A[2] & ~A[1] & ~A[0];
    assign Y[5]  = E & ~A[3] &  A[2] & ~A[1] &  A[0];
    assign Y[6]  = E & ~A[3] &  A[2] &  A[1] & ~A[0];
    assign Y[7]  = E & ~A[3] &  A[2] &  A[1] &  A[0];
    assign Y[8]  = E &  A[3] & ~A[2] & ~A[1] & ~A[0];
    assign Y[9]  = E &  A[3] & ~A[2] & ~A[1] &  A[0];
    assign Y[10] = E &  A[3] & ~A[2] &  A[1] & ~A[0];
    assign Y[11] = E &  A[3] & ~A[2] &  A[1] &  A[0];
    assign Y[12] = E &  A[3] &  A[2] & ~A[1] & ~A[0];
    assign Y[13] = E &  A[3] &  A[2] & ~A[1] &  A[0];
    assign Y[14] = E &  A[3] &  A[2] &  A[1] & ~A[0];
    assign Y[15] = E &  A[3] &  A[2] &  A[1] &  A[0];
endmodule
