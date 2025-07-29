module alu_tb;
    reg [3:0] A_tb, B_tb;
    reg [1:0] CTRL_tb;
    wire [7:0] RESULT_tb;

    alu uut (
        .A(A_tb),
        .B(B_tb),
        .ctrl(CTRL_tb),
        .result(RESULT_tb)
    );

    initial begin
        A_tb = 4'd3; B_tb = 4'd5; CTRL_tb = 2'b00; #20;
        A_tb = 4'd9; B_tb = 4'd2; CTRL_tb = 2'b01; #20;
        A_tb = 4'd6; B_tb = 4'd6; CTRL_tb = 2'b10; #20;
        $finish;
    end
endmodule