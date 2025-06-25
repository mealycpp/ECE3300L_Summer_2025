module decoder4x16_gate (
    input  wire [3:0] I,
    input  wire       W,
    output wire [15:0] O
);

  assign O[0]  = W & ~I[3] & ~I[2] & ~I[1] & ~I[0];
  assign O[1]  = W & ~I[3] & ~I[2] & ~I[1] &  I[0];
  assign O[2]  = W & ~I[3] & ~I[2] &  I[1] & ~I[0];
  assign O[3]  = W & ~I[3] & ~I[2] &  I[1] &  I[0];
  assign O[4]  = W & ~I[3] &  I[2] & ~I[1] & ~I[0];
  assign O[5]  = W & ~I[3] &  I[2] & ~I[1] &  I[0];
  assign O[6]  = W & ~I[3] &  I[2] &  I[1] & ~I[0];
  assign O[7]  = W & ~I[3] &  I[2] &  I[1] &  I[0];
  assign O[8]  = W &  I[3] & ~I[2] & ~I[1] & ~I[0];
  assign O[9]  = W &  I[3] & ~I[2] & ~I[1] &  I[0];
  assign O[10] = W &  I[3] & ~I[2] &  I[1] & ~I[0];
  assign O[11] = W &  I[3] & ~I[2] &  I[1] &  I[0];
  assign O[12] = W &  I[3] &  I[2] & ~I[1] & ~I[0];
  assign O[13] = W &  I[3] &  I[2] & ~I[1] &  I[0];
  assign O[14] = W &  I[3] &  I[2] &  I[1] & ~I[0];
  assign O[15] = W &  I[3] &  I[2] &  I[1] &  I[0];

endmodule
