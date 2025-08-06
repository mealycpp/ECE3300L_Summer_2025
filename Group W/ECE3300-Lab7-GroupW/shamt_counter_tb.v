`timescale 1ns / 1ps

module shamt_counter_tb(

    );
    
    reg clk_tb;
    reg btn_raw_tb;
    wire [1:0] shamt_tb;
    
    shamt_counter tb(
        .clk(clk_tb),
        .btn_raw(btn_raw_tb),
        .shamt(shamt_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    
    initial 
        begin
            clk_tb = 0;
            btn_raw_tb = 0;
            #40
            
            repeat (10)
                begin
                    btn_raw_tb = 1;
                    #40;
                    btn_raw_tb = 0;
                    #40;
                end
            
            #100
            
            $finish;           
            
        end
    
endmodule
