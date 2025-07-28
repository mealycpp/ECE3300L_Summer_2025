`timescale 1ns / 1ps

module seg7_scan_tb(

    );
    
    reg clk_tb;
    reg rst_n_tb;
    reg [3:0] onesPlace_tb;
    reg [3:0] tensPlace_tb;
    reg [3:0] digitCtrl_tb;
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;
    
    seg7_scan tb (
        .clk(clk_tb),
        .onesPlace(onesPlace_tb),
        .tensPlace(tensPlace_tb),
        .digitCtrl(digitCtrl_tb),
        .SEG(SEG_tb),
        .AN(AN_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    
    initial
        begin
            clk_tb = 0;
            rst_n_tb = 0;
            
            onesPlace_tb = 4'd1;
            tensPlace_tb = 4'd2;
            digitCtrl_tb = 4'b1100;
            rst_n_tb = 1; #40; rst_n_tb = 0;
            #40
            
            onesPlace_tb = 4'd9;
            tensPlace_tb = 4'd8;
            digitCtrl_tb = 4'b0001;
            rst_n_tb = 1; #40; rst_n_tb = 0;
            #40
            
            
            $finish;
        end
    
endmodule
