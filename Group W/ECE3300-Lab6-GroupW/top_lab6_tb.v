`timescale 1ns / 1ps

module top_lab6_tb(

    );
    
    reg CLK_tb;
    reg [4:0] SW_tb;
    reg [1:0] ALU_tb;
    reg dir0_tb;
    reg dir1_tb;
    reg RST_tb;
    wire [7:0] LED_tb;
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;
    
    top_lab6 tb (
        .CLK(CLK_tb),
        .SW(SW_tb),
        .ALU(ALU_tb),
        .dir0(dir0_tb),
        .dir1(dir1_tb),
        .RST(RST_tb),
        .LED(LED_tb),
        .SEG(SEG_tb),
        .AN(AN_tb)
    );
    
    always #5 CLK_tb = ~CLK_tb;
    
    initial
        begin
            CLK_tb = 0;
            SW_tb = 5'd31;
            dir0_tb = 0;
            dir1_tb = 1;
            ALU_tb = 2'b01;
            RST_tb = 0;
            #40
            
            RST_tb = 1; #40; RST_tb = 0;
            repeat (10) @(posedge CLK_tb);
            
            dir0_tb = 1;
            dir1_tb = 1;
            ALU_tb = 2'b00;
            RST_tb = 1; #40; RST_tb = 0;
            repeat (10) @(posedge CLK_tb);
            
            $finish;
        end
    
endmodule
