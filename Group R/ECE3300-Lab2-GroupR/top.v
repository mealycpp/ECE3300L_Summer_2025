module top(
    input  [3:0] A,
    input        E,
    output [15:0] Y
);
    decoder4x16_behav u1 (
        .A(A),
        .E(E),
        .Y(Y)
    );
endmodule
