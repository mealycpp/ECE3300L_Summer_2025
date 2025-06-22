`timescale 1ns / 1ps

module decoder4x16_gate (
    input  wire [3:0] A,   // A[3] -> A[0] from SW3 -> SW0
    input  wire       E,   // Enable from SW4
    output wire [15:0] Y   // outputs to LD15 -> LD0
);

// block enables 
wire en_low  = E & ~A[3];   // select Y[7:0]
wire en_high = E &  A[3];   // select Y[15:8]

// instantiate two 3-to-8 decoders 
dec3to8_gate low_block  (.a(A[2:0]), .en(en_low ), .y(Y[7:0]));
dec3to8_gate high_block (.a(A[2:0]), .en(en_high), .y(Y[15:8]));

endmodule



// 3-to-8 decoder gate implementationn

module dec3to8_gate (
    input  wire [2:0] a,
    input  wire       en,
    output wire [7:0] y
);
/* assign outputs based on enable and inputs.*/
assign y[0] = en & ~a[2] & ~a[1] & ~a[0]; 
assign y[1] = en & ~a[2] & ~a[1] &  a[0];
assign y[2] = en & ~a[2] &  a[1] & ~a[0];
assign y[3] = en & ~a[2] &  a[1] &  a[0];
assign y[4] = en &  a[2] & ~a[1] & ~a[0];
assign y[5] = en &  a[2] & ~a[1] &  a[0];
assign y[6] = en &  a[2] &  a[1] & ~a[0];
assign y[7] = en &  a[2] &  a[1] &  a[0];
endmodule
