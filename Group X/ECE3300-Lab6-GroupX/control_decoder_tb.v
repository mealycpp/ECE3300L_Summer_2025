`timescale 1ns / 1ps

module control_decoder_tb;
    reg Sw4, Sw3, Sw2, Sw1;
    wire [3:0] ctrl_nibble;

    control_decoder uut (
        .Sw4(Sw4),
        .Sw3(Sw3),
        .Sw2(Sw2),
        .Sw1(Sw1),
        .ctrl_nibble(ctrl_nibble)
    );

    initial begin
        // 0000 -> ctrl_nibble = 4'b0000
        {Sw1, Sw2, Sw3, Sw4} = 4'b0000; 
        #10;

        // 0001 -> ctrl_nibble = 4'b0001
        {Sw1, Sw2, Sw3, Sw4} = 4'b0001; 
        #10;

        // 0011 -> ctrl_nibble = 4'b0011
        {Sw1, Sw2, Sw3, Sw4} = 4'b0011; 
        #10;

        // 0101 -> ctrl_nibble = 4'b0101
        {Sw1, Sw2, Sw3, Sw4} = 4'b0101; 
        #10;

        // 1111 -> ctrl_nibble = 4'b1111
        {Sw1, Sw2, Sw3, Sw4} = 4'b1111; 
        #10;

        $finish;
    end
endmodule
