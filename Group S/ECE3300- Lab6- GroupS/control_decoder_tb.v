`timescale 1ns / 1ps

module control_decoder_tb;
    reg clk_div = 0;
    reg BTN0 = 1;
    reg [3:0] SW;

    wire [3:0] ctrl_nibble;
    
    control_decoder dut(
        .clk_div(clk_div),
        .BTN0(BTN0),
        .SW(SW),
        .ctrl_nibble(ctrl_nibble)
    );
    
    always #5 clk_div = ~clk_div;
    
    initial begin
    BTN0 = 0; //reset
    SW = 4'b0000;
    #100
    
    BTN0 = 1;
    SW = 4'b0101;
    #100
    
    SW = 4'b1010;
    #100
    
    BTN0 = 1;
    BTN0 = 0;
    #100
    
    SW = 4'b1111;
    #1000
    $finish;
    end
endmodule