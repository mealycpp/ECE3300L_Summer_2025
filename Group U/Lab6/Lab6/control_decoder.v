module control_decoder(
    input [3:0] nibble,
    output [3:0] ctrl_nibble
);
    assign ctrl_nibble = nibble;
endmodule
