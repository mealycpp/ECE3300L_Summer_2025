`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 07:44:17 PM
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
	
	reg [3:0] A_tb;
	reg E_tb;
	wire [15:0] Y_tb;
	
	decoder4x16_behav tb(
		.A(A_tb),
		.E(E_tb),
		.Y(Y_tb)
		);
		
	initial
		begin
			E_tb = 1'b1;
			A_tb = 4'b0000; // output 0
			
			#10
			
			A_tb = 4'b0001; // output 1
			
			#10
			
			A_tb = 4'b0010; // output 2
			
			#10
			
		    A_tb = 4'b0011; // output 3
			
			#10
			
			A_tb = 4'b0100; // output 4
			
			#10
			
			A_tb = 4'b0101; // output 5
			
			#10
			
			A_tb = 4'b0110; // output 6
			
			#10
			
			A_tb = 4'b0111; // output 7
			
			#10
			
			A_tb = 4'b1000; // output 8
			
			#10
			
			A_tb = 4'b1001; // output 9
			
			#10
			
			A_tb = 4'b1010; // output 10
			
			#10
			
			A_tb = 4'b1011; // output 11
			
			#10
			
			A_tb = 4'b1100; // output 12
			
			#10
			
			A_tb = 4'b1101; // output 13
			
			#10
			
			A_tb = 4'b1110; // output 14
			
			#10
			
			A_tb = 4'b1111; // output 15
			
			#10
			
			// E = 0
			E_tb = 1'b0;
			A_tb = 4'b0000; // output 0
			
			#10
			
			A_tb = 4'b0001; // output 1
			
			#10
			
			A_tb = 4'b0010; // output 2
			
			#10
			
		    A_tb = 4'b0011; // output 3
			
			#10
			
			A_tb = 4'b0100; // output 4
			
			#10
			
			A_tb = 4'b0101; // output 5
			
			#10
			
			A_tb = 4'b0110; // output 6
			
			#10
			
			A_tb = 4'b0111; // output 7
			
			#10
			
			A_tb = 4'b1000; // output 8
			
			#10
			
			A_tb = 4'b1001; // output 9
			
			#10
			
			A_tb = 4'b1010; // output 10
			
			#10
			
			A_tb = 4'b1011; // output 11
			
			#10
			
			A_tb = 4'b1100; // output 12
			
			#10
			
			A_tb = 4'b1101; // output 13
			
			#10
			
			A_tb = 4'b1110; // output 14
			
			#10
			
			A_tb = 4'b1111; // output 15
			
			#10
			
			$display("FAIL: A=%b E=%b Y=%b (expected %b)", A_tb, E_tb, Y_tb, 16'b1);
			$fatal;
			$finish;
			
		end
endmodule
