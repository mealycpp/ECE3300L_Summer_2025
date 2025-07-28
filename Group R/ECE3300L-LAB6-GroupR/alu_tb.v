`timescale 1ns / 1ps


module alu_tb;


    reg [3:0] A, B;
    reg [1:0] ctrl;
    wire [7:0] result;

    alu uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
    );

    initial begin
        $display("ALU Testbench Start");
        A = 4'd5; B = 4'd3;

        ctrl = 2'b00; #10; // Add
        $display("A=%d B=%d ctrl=00 (ADD) => result=%d", A, B, result);

        ctrl = 2'b01; #10; // Sub
        $display("A=%d B=%d ctrl=01 (SUB) => result=%d", A, B, result);

        A = 4'd2; B = 4'd7;
        ctrl = 2'b01; #10; // Sub with underflow
        $display("A=%d B=%d ctrl=01 (SUB) => result=%d", A, B, result);

        ctrl = 2'b10; #10; // Invalid op
        $display("A=%d B=%d ctrl=10 (INVALID) => result=%d", A, B, result);

        $display("ALU Testbench Done");
        $finish;
    end

endmodule
