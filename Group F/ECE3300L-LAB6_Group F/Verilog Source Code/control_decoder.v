module control_decoder (
    input  wire [3:0] nibble,       // {SW8, SW7, SW6, SW5}
    output wire [3:0] ctrl_nibble   // For display
);
    assign ctrl_nibble = nibble;
endmodule
