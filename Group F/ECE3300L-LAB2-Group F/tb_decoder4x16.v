`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:39:48 AM
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
    reg [3:0] A;
    reg E;
    wire [15:0] Y;
    integer i;
    
    decoder4x16_gate TB_TESTING(.A(A), .Y(Y), .E(E));
    
   reg [15:0] expectedY [0:15];
   
    initial begin
        expectedY[0] = 16'h0001;
        expectedY[1] = 16'h0002;
        expectedY[2] = 16'h0004;
        expectedY[3] = 16'h0008;
        expectedY[4] = 16'h0010;
        expectedY[5] = 16'h0020;
        expectedY[6] = 16'h0040;
        expectedY[7] = 16'h0080;
        expectedY[8] = 16'h0100;
        expectedY[9] = 16'h0200;
        expectedY[10] = 16'h0400;
        expectedY[11] = 16'h0800;
        expectedY[12] = 16'h1000;
        expectedY[13] = 16'h2000;
        expectedY[14] = 16'h4000;
        expectedY[15] = 16'h8000;
        E = 1'b1;
        $display("ENABLE HIGH");
        for(i=0; i<16; i=i+1) begin
            A=i;
            #20;
            $display("INPUT: %04b | EXPECTED: %04h | RESULT: %04h (%s)", A, expectedY[i], Y, (expectedY[i] == Y) ? "PASSED" : "FAILED");
        end
        E = 1'b0;
        $display("ENABLE LOW");
        for(i=0; i<16; i=i+1) begin
            A=i;
            #20;
            $display("INPUT: %04b | EXPECTED: %04h | RESULT: %04h (%s)", A, 16'h0000, Y, (16'h0000 == Y) ? "PASSED" : "FAILED");
        end
        
        $finish;
    end
endmodule
