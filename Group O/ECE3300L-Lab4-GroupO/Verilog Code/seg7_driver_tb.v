`timescale 1ns / 1ps

module seg7_driver_tb;


    reg clk;
    reg [15:0] SW;


    wire [15:0] LED;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;


    seg7_driver uut (
        .clk(clk),
        .SW(SW),
        .LED(LED),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN)
    );

  
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        SW = 16'b0000_0000_0000_0000;

        #100;

        SW[3:0] = 4'hA;
        #100;

        SW[7:4] = 4'h3;
        #100;

        SW[11:8] = 4'h7;
        #100;

        SW[15:12] = 4'hF;
        #100;

        SW = 16'hFFFF;
        #200;

        SW = 16'h0000;
        #200;

        $finish;
    end

endmodule
