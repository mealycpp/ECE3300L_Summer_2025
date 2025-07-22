`timescale 1ns / 1ps

module bcd_updown_top_tb;

    reg CLK;
    reg [4:0] SW;
    reg BTN1;
    reg BTN0;

    // Outputs
    wire [7:0] AN;
    wire [6:0] SEG;
    wire [12:0] LED;

    wire tick;
    wire [3:0] units, tens;
    wire dir;

    bcd_updown_top uut (
        .CLK(CLK),
        .SW(SW),
        .BTN1(BTN1),
        .BTN0(BTN0),
        .AN(AN),
        .SEG(SEG),
        .LED(LED)
    );

    assign tick = uut.u_tick.tick;
    assign units = uut.u_counter.units;
    assign tens = uut.u_counter.tens;
    assign dir = uut.dir;

    initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin
        $display("Starting bcd_updown_top_tb...");
        $monitor("Time=%0t | BTN0=%b, BTN1=%b, SW=%d | dir=%b, tick=%b | tens=%d, units=%d | LED=%h", 
                 $time, BTN0, BTN1, SW, dir, tick, tens, units, LED);

        BTN0 = 1;
        BTN1 = 0;
        SW = 5'd29;
        #20;
        BTN0 = 0;
        #20;

        $display("\nCounting up...");
        #2000;

        $display("\nChanging direction to count down...");
        BTN1 = 1;
        #10; // Hold button for one clock cycle
        BTN1 = 0;
        #2000;

        $display("\nChanging direction to count up again...");
        @(posedge CLK);
        BTN1 = 1;
        @(posedge CLK);
        BTN1 = 0;
        #2000;

        $display("\nAsserting reset...");
        BTN0 = 1;
        #20;
        BTN0 = 0;
        #100;

        $display("Finished bcd_updown_top_tb.");
        $stop;
    end

endmodule
