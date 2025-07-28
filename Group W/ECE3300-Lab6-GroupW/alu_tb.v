`timescale 1ns / 1ps

module alu_tb(

    );
    
    reg [3:0] A_tb, B_tb;
    reg [1:0] ctrl_tb;
    wire [7:0] out_tb;
    
    alu tb (
        .A(A_tb),
        .B(B_tb),
        .ctrl(ctrl_tb),
        .out(out_tb)
    );
    
    initial 
        begin
            ctrl_tb = 2'b00;
            A_tb = 4'd2;
            B_tb = 4'd6;
            #100
            
            ctrl_tb = 2'b01;
            A_tb = 4'd9;
            B_tb = 4'd5;
            #100
            
            $finish;
            
        end
endmodule
