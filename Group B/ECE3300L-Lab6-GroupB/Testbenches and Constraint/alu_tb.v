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
        $display("Starting alu_tb");

        A = 4'd4; B = 4'd3; ctrl = 2'b00; #20;
        $display("A = %d, B = %d, ctrl = %b -> result = %d", A, B, ctrl, result);

        ctrl = 2'b01; #20;
        $display("A = %d, B = %d, ctrl = %b -> result = %d", A, B, ctrl, result);

        A = 4'd2; B = 4'd5; ctrl = 2'b01; #20;
        $display("A = %d, B = %d, ctrl = %b -> result = %d (wrap from underflow)", A, B, ctrl, result);

        ctrl = 2'b10; #20;
        $display("ctrl = %b -> result = %d (default case)", ctrl, result);
    end
endmodule
