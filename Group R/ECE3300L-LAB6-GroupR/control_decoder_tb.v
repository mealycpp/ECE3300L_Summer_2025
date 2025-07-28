`timescale 1ns / 1ps


module control_decoder_tb;

    reg [3:0] sw_ctrl;
    wire [3:0] ctrl_nibble;

    control_decoder uut (
        .sw_ctrl(sw_ctrl),
        .ctrl_nibble(ctrl_nibble)
    );

    initial begin
        $display("Control Decoder Testbench Start");

        sw_ctrl = 4'b1010; #10;
        $display("Input=%b => Output=%b", sw_ctrl, ctrl_nibble);

        sw_ctrl = 4'b0101; #10;
        $display("Input=%b => Output=%b", sw_ctrl, ctrl_nibble);

        sw_ctrl = 4'b1111; #10;
        $display("Input=%b => Output=%b", sw_ctrl, ctrl_nibble);

        sw_ctrl = 4'b0000; #10;
        $display("Input=%b => Output=%b", sw_ctrl, ctrl_nibble);

        $display("Control Decoder Testbench Done");
        $finish;
    end
endmodule
