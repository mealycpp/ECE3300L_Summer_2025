`timescale 1ns / 1ps

module bcd_up_down_counter_tb(

    );
    
    reg clk_processed_tb;
    reg rst_n_tb;
    reg dir_tb;
    wire [3:0] digit_tb;
    
    bcd_up_down_counter tb (
        .clk_processed(clk_processed_tb),
        .rst_n(rst_n_tb),
        .dir(dir_tb),
        .digit(digit_tb)
    );
    
    always #5 clk_processed_tb = ~clk_processed_tb;
    
    initial
        begin
            clk_processed_tb = 0;
            rst_n_tb = 0;
            dir_tb = 0;
            #40
            
            dir_tb = 1;
            rst_n_tb = 0; #40; rst_n_tb = 1;
            repeat (12) @(posedge clk_processed_tb);
            
            dir_tb = 0;
            rst_n_tb = 0; #40; rst_n_tb = 1;
            repeat (12) @(posedge clk_processed_tb);
            
            $finish;
            
        end
    
    
    
endmodule
