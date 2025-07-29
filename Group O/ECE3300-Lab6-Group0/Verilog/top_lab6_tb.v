`timescale 1ns / 1ps

module top_lab6_tb;

    reg CLK_tb;
    reg BTN0_tb;
    reg [8:0] SW_tb;
    wire [7:0] LED_tb;
    wire [7:0] AN_tb;
    wire [6:0] SEG_tb;

    top_lab6 uut (
        .CLK(CLK_tb),
        .BTN0(BTN0_tb),
        .SW(SW_tb),
        .LED(LED_tb),
        .AN(AN_tb),
        .SEG(SEG_tb)
    );

    initial CLK_tb = 0;
    always #5 CLK_tb = ~CLK_tb;

    initial begin
        BTN0_tb = 1;
        SW_tb = 9'b000000000; 

        #20 BTN0_tb = 0; 
        #40 BTN0_tb = 1;   

        SW_tb[4:0] = 5'b10100; 
        SW_tb[7] = 1;  
        SW_tb[8] = 1;     
        SW_tb[6:5] = 2'b00; 

        #200;

        SW_tb[7] = 0;    
        SW_tb[8] = 1;     
        SW_tb[6:5] = 2'b00;  
        #200;

        SW_tb[6:5] = 2'b01;
        #200;

        SW_tb[8:5] = 4'b1010; 
        #200;

        $finish;
    end
endmodule