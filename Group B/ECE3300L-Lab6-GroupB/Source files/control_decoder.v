module control_decoder(
    input [3:0] sw,
    output [3:0] ctrl_nibble
);
    assign ctrl_nibble = sw;
endmodule
