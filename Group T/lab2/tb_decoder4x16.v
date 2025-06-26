`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 10:59:28 PM
// Design Name: 
// Module Name: tb_decoder4x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_decoder4x16(
    );
    wire [15:0] Y_tb;
    reg [3:0] A_tb;
    reg E_tb;
    
    demux4to16 X(.A(A_tb), .E(E_tb), .Y(Y_tb));
    
    initial
        begin
            A_tb = 4'b0000;
            E_tb = 1'b0;
        #50
            A_tb = 4'b0001;
            E_tb = 1'b0;
        #50
            A_tb = 4'b0000;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0001;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0010;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0011;
            E_tb = 1'b1;
        #50
           A_tb = 4'b0100;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0101;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0110;
            E_tb = 1'b1;
        #50
            A_tb = 4'b0111;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1000;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1001;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1010;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1011;
            E_tb = 1'b1;
        #50
           A_tb = 4'b1100;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1101;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1110;
            E_tb = 1'b1;
        #50
            A_tb = 4'b1111;
            E_tb = 1'b1;
        #50
            $finish;
        end
endmodule
