`timescale 1ns / 1ps

module mux2x1 (
    input a, b,
    input sel,
    output y
    );

    wire nsel, a1, b1;
    not (nsel, sel);
    and (a1, a, nsel);
    and (b1, b, sel);
    or (y, a1, b1);

endmodule
