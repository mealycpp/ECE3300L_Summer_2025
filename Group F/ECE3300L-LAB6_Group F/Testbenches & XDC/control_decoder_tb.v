// control_decoder_tb.v
`timescale 1ns / 1ps

module control_decoder_tb;
    reg [2:0] opcode;
    wire [3:0] ctrl;

    control_decoder uut (
        .opcode(opcode),
        .ctrl(ctrl)
    );

    initial begin
        $monitor("Time=%0t opcode=%b ctrl=%b", $time, opcode, ctrl);

        opcode = 3'b000; #10;
        opcode = 3'b001; #10;
        opcode = 3'b010; #10;
        opcode = 3'b011; #10;
        opcode = 3'b100; #10;
        opcode = 3'b101; #10;
        opcode = 3'b110; #10;
        opcode = 3'b111; #10;
        $finish;
    end
endmodule
