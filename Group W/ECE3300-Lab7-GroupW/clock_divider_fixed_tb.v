`timescale 1ns / 1ps

module clock_divider_fixed_tb(

    );
    
    reg clk_tb;
    reg rst_n_tb;
    wire clk_out_tb;
    
    clock_divider_fixed tb (
        .clk(clk_tb),
        .rst_n(rst_n_tb),
        .clk_out(clk_out_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    
    initial 
        begin
            clk_tb = 0;
            rst_n_tb = 1;
            
            #100
            rst_n_tb = 0; 
            #100
            rst_n_tb = 1;
            #100
            
            $finish;
            
        end
    
endmodule
