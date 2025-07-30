`timescale 1ns / 1ps

module control_decoder_tb;

    reg [3:0] control_input_test;
    wire [3:0] ctrl_out;

    control_decoder dut_instance (
        .nibble(control_input_test),
        .ctrl_nibble(ctrl_out)
    );

    initial begin
        control_input_test = 4'b0000;
        #10 control_input_test = 4'b1001;
        #10 control_input_test = 4'b1111;
        #10 $stop;
    end

endmodule
