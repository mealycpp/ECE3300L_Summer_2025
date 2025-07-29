`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:50:43 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

    reg [1:0] control;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] result;

    alu uut (
        .control(control),
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        $display("Time\tControl\tA\tB\tResult\tDecimal Value");
        $monitor("%0t\t%b\t%d\t%d\t%08b\t%d", 
                 $time, control, a, b, result, (result[4]*10 + result[3:0]));
    end

    initial begin
        control = 2'b00; //add
        a = 4'd3; b = 4'd6;// 3 + 6 = 9
        #10;   
        a = 4'd7; b = 4'd8; // 7 + 8 = 15
        #10;   
        a = 4'd9; b = 4'd7; // 9 + 7 = 16
        #10;   
        a = 4'd1; b = 4'd1;// 1 + 1 = 2 
        #10; 

        // subtract
        control = 2'b01;

        a = 4'd9; b = 4'd3; // 9 - 3 = 6
        #10;   
        a = 4'd9; b = 4'd0;  // 12 - 7 = 5
        #10; 
        a = 4'd0; b = 4'd2; // 3 - 4 = -1 wraps
        #10;   
        a = 4'd0; b = 4'd0; //0
        #10;  
        
        control = 2'b10; 
        a = 4'd5; 
        b = 4'd5; 
        #10;
        control = 2'b11;
         a = 4'd9;
         b = 4'd2; 
          #10; // result = 0

        $finish;
    end
    
endmodule
