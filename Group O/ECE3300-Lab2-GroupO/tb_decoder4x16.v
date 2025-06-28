`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 06:47:19 PM
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


module tb_decoder4x16;
reg [3:0] A;
reg E;
wire [15:0] Y;

decoder4x16_behav DUT (.A(A), .E(E), .Y(Y));

integer i;

initial begin
E = 0;
A = 4'b0000;
#10;
if (Y !== 16'b0) begin
    $display("FAIL: E=0 should give all 0s.");
    $fatal;
end else begin
    $display("PASS: E=0 test passed");
    end
    
    E = 1;
    for (i = 0; i <16; i = i + 1) begin
    A = i;
    #10;
    if (Y !== (16'b1 << i)) begin
        $display("FAIL: A=%b Y=%b", A, Y);
        $fatal;
    end else begin
        $display("PASS: A=%b Y=%b", A, Y);
    end
    end
    
    $display("All tests passed!");
    $finish;
    end

    
endmodule
