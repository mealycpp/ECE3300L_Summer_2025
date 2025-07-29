//jaden

module control_decoder(input [3:0] switches, output [3:0] nibble);
    assign nibble = switches;  // Direct mapping of {SW8, SW7, SW6, SW5}
endmodule
