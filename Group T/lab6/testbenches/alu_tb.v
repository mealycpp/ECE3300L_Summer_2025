`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 05:47:01 AM
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


module alu_tb(

    );

    reg [3:0] units_tb = 0, tens_tb = 0;
    reg  [1:0] operation_select_tb = 2'b00;
    wire [7:0] result_tb;

    alu A(
        .units(units_tb),
        .tens(tens_tb),
        .operation_select(operation_select_tb),
        .result(result_tb)
    );

    integer i,j;

    initial 
    begin
        #10;
        for(i = 0; i < 9; i = i+1) begin
            for(j = 0; j < 9; j = j+1) begin
                units_tb <= units_tb + 1;
                #10;
            end
            tens_tb <= tens_tb + 1;
            units_tb = 0;
            #10;
        end
        operation_select_tb = 2'b01;
        tens_tb = 9;
        for(i = 0; i < 9; i = i+1) begin
            for(j = 0; j < 9; j = j+1) begin
                units_tb <= units_tb + 1;
                #10;
            end
            tens_tb <= tens_tb - 1;
            units_tb = 0;
            #10;
        end
        $finish;    
    end
endmodule
