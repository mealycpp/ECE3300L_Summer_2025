module alu_tb(
    );
reg [3:0]A;
reg [3:0]B;
reg [1:0]CTRL;
wire [7:0]RESULT;
    
    alu uut(
    .A(A),
    .B(B),
    .CTRL(CTRL),
    .RESULT(RESULT)
    );
    initial begin 
    A = 4'd4;
    B = 4'd9;
    CTRL = 0;
    #10;
    CTRL = 1;
    #10;
    CTRL = 2;
    #10;
    CTRL = 3;
    #10;
    $finish;
    end
    endmodule