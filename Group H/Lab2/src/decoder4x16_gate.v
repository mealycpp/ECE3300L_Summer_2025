module decoder4x16_gate(
    input  [3:0] A,  // 4-bit input
    input        E,  // Enable
    output [15:0] Y  // 16-bit one-hot output
);

// Invert inputs
wire nA0 = ~A[0];
wire nA1 = ~A[1];
wire nA2 = ~A[2];
wire nA3 = ~A[3];

assign Y[0]  = E &  nA3 &  nA2 &  nA1 &  nA0;
assign Y[1]  = E &  nA3 &  nA2 &  nA1 &  A[0];
assign Y[2]  = E &  nA3 &  nA2 &  A[1] &  nA0;
assign Y[3]  = E &  nA3 &  nA2 &  A[1] &  A[0];
assign Y[4]  = E &  nA3 &  A[2] &  nA1 &  nA0;
assign Y[5]  = E &  nA3 &  A[2] &  nA1 &  A[0];
assign Y[6]  = E &  nA3 &  A[2] &  A[1] &  nA0;
assign Y[7]  = E &  nA3 &  A[2] &  A[1] &  A[0];
assign Y[8]  = E &  A[3] &  nA2 &  nA1 &  nA0;
assign Y[9]  = E &  A[3] &  nA2 &  nA1 &  A[0];
assign Y[10] = E &  A[3] &  nA2 &  A[1] &  nA0;
assign Y[11] = E &  A[3] &  nA2 &  A[1] &  A[0];
assign Y[12] = E &  A[3] &  A[2] &  nA1 &  nA0;
assign Y[13] = E &  A[3] &  A[2] &  nA1 &  A[0];
assign Y[14] = E &  A[3] &  A[2] &  A[1] &  nA0;
assign Y[15] = E &  A[3] &  A[2] &  A[1] &  A[0];

endmodule
