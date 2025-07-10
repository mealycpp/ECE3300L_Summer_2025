`timescale 1ns / 1ps

module seg7_driver_tb();

    reg clk_tb, rst_n_tb;
    reg [31:0] SW_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;
    
    seg7_driver tb (
        .clk(clk_tb),
        .SW(SW_tb),
        .rst_n(rst_n_tb),
        .Cnode(Cnode_tb),
        .dp(dp_tb),
        .AN(AN)
    );
    
    always #5 clk_tb = ~clk_tb;
    initial begin
        clk_tb = 0;
        rst_n_tb = 0;
        SW_tb = 32'h00000000;
        
        #20 rst_n_tb = 1;
        
        #20 SW_tb = 32'hABCD1234;
        
        #20
        $stop;
    end

endmodule
