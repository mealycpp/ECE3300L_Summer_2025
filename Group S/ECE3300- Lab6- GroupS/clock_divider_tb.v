`timescale 1ns / 1ps

module clock_divider_tb;
    reg clk = 0;
    reg BTN0 = 1;
    reg [4:0] sel;

    wire [31:0] cnt;
    wire clk_div;
    
    clock_divider dut(
        .clk(clk),
        .BTN0(BTN0),
        .sel(sel),
        .cnt(cnt),
        .clk_div(clk_div)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        BTN0 = 0; 
        sel = 5'd0; #20;
        BTN0 = 1;
            
        sel = 5'd0;  #200;
        sel = 5'd1;  #200;
        sel = 5'd3;  #200;
        sel = 5'd5;  #200;
        sel = 5'd7;  #200;

        BTN0 = 0; #20;
        BTN0 = 1; #100;
        $finish;
    end
endmodule
    