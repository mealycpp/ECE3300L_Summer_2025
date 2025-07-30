`timescale 1ns / 1ps

module alu_tb;

    reg [3:0] A, B;
    reg [1:0] control_input_test;
    wire [7:0] alu_result_test;

    alu dut_instance (
        .A(A),
        .B(B),
        .ctrl(control_input_test),
        .result(alu_result_test)
    );

    initial begin
        A = 4'd3; B = 4'd2; control_input_test = 2'b00; // A + B
        #20;
        control_input_test = 2'b01; // A - B
        #20;
        control_input_test = 2'b10; // default
        #20;
        $stop;
    end

endmodule
