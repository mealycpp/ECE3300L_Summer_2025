`timescale 1ns / 1ps

module debounce_toggle_tb(
    
    );
    
    reg clk_tb;
    reg btn_raw_tb;
    wire btn_toggle_tb;
    
    debounce_toggle tb (
        .clk(clk_tb),
        .btn_raw(btn_raw_tb),
        .btn_toggle(btn_toggle_tb)
    );
    
    always #5 clk_tb = ~clk_tb;
    
    initial 
        begin
            clk_tb = 0;
            btn_raw_tb = 0;
            
            #100
            btn_raw_tb = 1;
            #40
            btn_raw_tb = 0;
            #40
            
            btn_raw_tb = 1;
            #40
            btn_raw_tb = 0;
            #100
            
            $finish;
            
        end
    
endmodule
