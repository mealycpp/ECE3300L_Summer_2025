`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
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
    
    reg [3:0] units_BCD, tens_BCD;
    reg [1:0] ctrl;
    wire [7:0] result;
    integer i;
    
    alu addsub(units_BCD, tens_BCD, ctrl, result);
    
    initial begin
        ctrl = 2'b00;
        for(i=0;i<=10;i=i+1) begin
            #5 tens_BCD = i;
            units_BCD = i;
        end
        ctrl = 2'b01;
        tens_BCD = 5;
        for(i=0;i<=10;i=i+1) begin
            #5 units_BCD = i;
        end
        units_BCD = 0;
        for(i=0;i<=10;i=i+1) begin
            #5 tens_BCD = i;
        end
        ctrl = 2'b10;
        tens_BCD = 0;
        for(i=0;i<=10;i=i+1) begin
            #5 units_BCD = i;
        end
        units_BCD = 0;
        for(i=0;i<=10;i=i+1) begin
            #5 tens_BCD = i;
        end
        ctrl = 2'b11;
        tens_BCD = 0;
        for(i=0;i<=10;i=i+1) begin
            #5 units_BCD = i;
        end
        units_BCD = 0;
        for(i=0;i<=10;i=i+1) begin
            #5 tens_BCD = i;
        end
    end
    
endmodule
