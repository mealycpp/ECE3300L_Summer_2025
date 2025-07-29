module alu_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ctrl;

    wire [7:0] result;

alu dut(
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .result(result)
    );
    
    initial begin
    A = 4'd6;
    B = 4'd2;
    ctrl = 2'b00; 
    #200   
    
    A = 4'd8;
    B = 4'd2;
    ctrl = 2'b01; 
    #200  
    
    A = 4'd2;
    B = 4'd8;
    ctrl = 2'b01; 
    #200            
    
    A = 4'd2;
    B = 4'd8;
    ctrl = 2'b10; 
    #200     
    
    A = 4'd1;
    B = 4'd1;
    ctrl = 2'b11;
    #200
    $finish;
    end
endmodule