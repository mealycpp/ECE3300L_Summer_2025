`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 11:23:49 PM
// Design Name: 
// Module Name: mux32x1_tb
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


module mux32x1_tb;

    reg [31:0] count;
    reg [4:0] sel;
    reg clk;
    wire clk_out;
    integer i, j;
    
    mux32x1 uut (
        .count(count),
        .sel(sel),
        .clk_out(clk_out)
    );
    
initial begin 
clk = 0;
count = 31'b0;
sel = 0;
forever #10 
clk=~clk;
end

 always@(posedge clk)begin
      //  for (i = 0; i < 64; i = i + 1) begin
            count = count+1;
          //  sel = i[4:0];
            #5;
            for (j=0; j<32; j=j+1) begin
         //   count = 1'b1<<j;
         sel = sel+1;
            #100;
            $monitor("sel = %b , count[%b] = %b , clk_out = %b", sel, j, count, clk_out);
            #5;
        end

        $finish;
    end
endmodule
