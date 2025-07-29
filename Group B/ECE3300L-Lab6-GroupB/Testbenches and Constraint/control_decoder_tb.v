`timescale 1ns / 1ps
module control_decoder_tb;
    reg [3:0] sw;
    wire [3:0] ctrl_nibble;

    control_decoder uut (
        .sw(sw),
        .ctrl_nibble(ctrl_nibble)
    );

    initial begin
        $display("Starting control_decoder_tb");
        $monitor("SW = %b (%1X) -> ctrl_nibble = %b (%1X)", sw, sw, ctrl_nibble, ctrl_nibble);

        sw = 4'b0000; #20;  // Expect 0
        sw = 4'b1001; #20;  // Expect 9
        sw = 4'b1010; #20;  // Expect A
        sw = 4'b1101; #20;  // Expect D
        sw = 4'b1111; #20;  // Expect F
    end
endmodule
