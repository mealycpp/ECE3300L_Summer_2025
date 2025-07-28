`timescale 1ns / 1ps

module top_lab6_tb();
    reg CLK;
    reg BTN0;
    reg [8:0] SW;

    wire [6:0] SEG;
    wire [7:0] AN;
    wire [7:0] LED;

    top_lab6 uut (
        .CLK(CLK),
        .BTN0(BTN0),
        .SW(SW),
        .SEG(SEG),
        .AN(AN),
        .LED(LED)
    );

    initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin

        BTN0 = 0;
        SW = 9'b000000000;
        #20;
        BTN0 = 1;
        SW[4:0] = 5'd20;

        // Count up both A and B, ADD
        SW[7] = 1; // Counter A up
        SW[8] = 1; // Counter B up
        SW[6:5] = 2'b00; // ALU: ADD
        SW[8:5] = 4'b0000; // ctrl_nibble
        #200;

        // A up, B down, SUB 
        SW[8] = 0; // Counter B down
        SW[6:5] = 2'b01; // ALU: SUB
        #200;

        // change ALU to default
        SW[6:5] = 2'b11; // ALU: unsupported
        #200;

        // test display digits change
        SW[8:5] = 4'b1111;
        #200;

        //reset
        BTN0 = 0;
        #20;
        BTN0 = 1;
        #200;

        $finish;
    end
endmodule
