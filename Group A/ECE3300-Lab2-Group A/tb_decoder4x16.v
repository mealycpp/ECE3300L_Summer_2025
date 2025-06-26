`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 05:36:17 PM
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
    
    reg [3:0] in;
    reg enable;
    wire [15:0] out;
    integer i;
    
    decoder4x16_gate TB_TESTING(.in(in), .out(out), .enable(enable));
    
   reg [15:0] expectedOutput [0:15];
   
    initial begin
        expectedOutput[0] = 16'h0001;
        expectedOutput[1] = 16'h0002;
        expectedOutput[2] = 16'h0004;
        expectedOutput[3] = 16'h0008;
        expectedOutput[4] = 16'h0010;
        expectedOutput[5] = 16'h0020;
        expectedOutput[6] = 16'h0040;
        expectedOutput[7] = 16'h0080;
        expectedOutput[8] = 16'h0100;
        expectedOutput[9] = 16'h0200;
        expectedOutput[10] = 16'h0400;
        expectedOutput[11] = 16'h0800;
        expectedOutput[12] = 16'h1000;
        expectedOutput[13] = 16'h2000;
        expectedOutput[14] = 16'h4000;
        expectedOutput[15] = 16'h8000;
        enable = 1'b1;
        $display("ENABLE HIGH");
        for(i=0; i<16; i=i+1) begin
            in=i;
            #20;
            $display("INPUT: %04b | EXPECTED: %04h | RESULT: %04h (%s)", in, expectedOutput[i], out, (expectedOutput[i] == out) ? "PASSED" : "FAILED");
        end
        enable = 1'b0;
        $display("ENABLE LOW");
        for(i=0; i<16; i=i+1) begin
            in=i;
            #20;
            $display("INPUT: %04b | EXPECTED: %04h | RESULT: %04h (%s)", in, 16'h0000, out, (16'h0000 == out) ? "PASSED" : "FAILED");
        end
        
        $finish;
    end
endmodule
