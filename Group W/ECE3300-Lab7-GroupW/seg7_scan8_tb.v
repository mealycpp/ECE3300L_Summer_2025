`timescale 1ns / 1ps

module seg7_scan8_tb(

    );
    
    reg clk_tb;
    reg rst_n_tb;
    reg [3:0] onesPlace_tb;
    reg [3:0] tensPlace_tb;
    reg [3:0] hundredsPlace_tb;
    reg [3:0] thousandsPlace_tb;
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;
    
    seg7_scan8 tb(
        .clk(clk_tb),
        .rst_n(rst_n_tb),
        .onesPlace(onesPlace_tb),
        .tensPlace(tensPlace_tb),
        .hundredsPlace(hundredsPlace_tb),
        .thousandsPlace(thousandsPlace_tb),
        .SEG(SEG_tb),
        .AN(AN_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    
    initial
        begin
            clk_tb = 0;
            rst_n_tb = 0;
            
            onesPlace_tb = 0;
            tensPlace_tb = 0;
            hundredsPlace_tb = 0;
            thousandsPlace_tb = 0;
            rst_n_tb = 1; #40; rst_n_tb = 0;
            #40
            
            onesPlace_tb = 4'd15;
            tensPlace_tb = 4'd15;
            hundredsPlace_tb = 4'd15;
            thousandsPlace_tb = 4'd15;
            rst_n_tb = 1; #40; rst_n_tb = 0;
            #40
        
            $finish;
        end
        
endmodule
