`timescale 1ns / 1ps

module clock_divider_tb;
    reg clockIn = 0;
    reg [4:0] sel;    
    wire clk_div;    

  
    clock_divider uut (
        .clockIn(clockIn),
        .sel(sel),
        .clk_div(clk_div)
    );

    
    always #5 clockIn = ~clockIn;

    initial begin
        
        sel = 5'd0;   
        #100;

        sel = 5'd2;   
        #200;

        sel = 5'd4;   
        #200;

        sel = 5'd10;  
        #200;

        $finish;
    end
endmodule
