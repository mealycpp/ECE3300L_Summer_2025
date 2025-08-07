`timescale 1ns / 1ps

module seg7_scan8_tb;
    reg clk;
    reg [55:0] seg_data;
    
    wire [7:0] an;
    wire [6:0] seg;
    
    always #5 clk = ~clk;
    
    seg7_scan8 uut (
        .clk(clk),
        .seg_data(seg_data),
        .an(an),
        .seg(seg)
    );
    
    initial begin
        clk = 0;
        seg_data = 0;
        
        #10 seg_data = {28'hFFFFFFF, 
                       7'b0000001, 
                       7'b1001111, 
                       7'b0010010, 
                       7'b0000110}; 
        #100;
        
        #10 seg_data = {56{7'b1111111}};
        #100;
        
        #10 seg_data = {8{7'b0000000}};
        #100;
        
        $finish;
    end
endmodule