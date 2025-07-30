`timescale 1ns / 1ps

module top_lab6_tb;

    reg CLK;
    reg BTN0;
    reg [8:0] SW;
    wire [7:0] LED;
    wire [7:0] AN;
    wire [6:0] SEG;

    top_lab6 dut_instance (
        .CLK(CLK),
        .BTN0(BTN0),
        .SW(SW),
        .LED(LED),
        .AN(AN),
        .SEG(SEG)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        BTN0 = 0; SW = 9'b000000000;
        #20 BTN0 = 1;
        SW[8] = 1; // tens dir = up
        SW[7] = 1; // units dir = up
        SW[6:5] = 2'b00; // ALU = add
        SW[4:0] = 5'd10; // moderate speed
        #1000;
        $stop;
    end

endmodule
