`timescale 1ns / 1ps

module bcd_updown_top_tb;

    // Inputs
    reg CLK;
    reg [4:0] SW;
    reg BTN1;
    reg BTN0;

    // Outputs
    wire [7:0] AN;
    wire [6:0] SEG;
    wire [12:0] LED;
    
    // Internal signals for monitoring
    wire tick;
    wire [3:0] units, tens;
    wire dir;

    // Instantiate the Unit Under Test (UUT)
    bcd_updown_top uut (
        .CLK(CLK),
        .SW(SW),
        .BTN1(BTN1),
        .BTN0(BTN0),
        .AN(AN),
        .SEG(SEG),
        .LED(LED)
    );
    
    // Assign internal wires for monitoring purposes
    assign tick = uut.u_tick.tick;
    assign units = uut.u_counter.units;
    assign tens = uut.u_counter.tens;
    assign dir = uut.dir;

    // Clock generation (100 MHz)
    initial CLK = 0;
    always #5 CLK = ~CLK; // <-- Corrected this line from ~clk to ~CLK

    // Test stimulus
    initial begin
        $display("Starting bcd_updown_top_tb...");
        $monitor("Time=%0t | BTN0=%b, BTN1=%b, SW=%d | dir=%b, tick=%b | tens=%d, units=%d | LED=%h", 
                 $time, BTN0, BTN1, SW, dir, tick, tens, units, LED);

        // 1. Assert reset (BTN0 is active high reset in the testbench context)
        BTN0 = 1; // rst_n = 0
        BTN1 = 0;
        SW = 5'd29; // Set a reasonably fast tick rate for simulation (tick every 8 clocks)
        #20;
        BTN0 = 0; // Release reset
        #20;

        // 2. Let it count up for a while
        $display("\nCounting up...");
        #2000;

        // 3. Press BTN1 to change direction to down
        $display("\nChanging direction to count down...");
        BTN1 = 1;
        #10; // Hold button for one clock cycle
        BTN1 = 0;
        #2000;

        // 4. Press BTN1 again to change direction to up
        $display("\nChanging direction to count up again...");
        @(posedge CLK);
        BTN1 = 1;
        @(posedge CLK);
        BTN1 = 0;
        #2000;
        
        // 5. Assert reset again
        $display("\nAsserting reset...");
        BTN0 = 1;
        #20;
        BTN0 = 0;
        #100;

        $display("Finished bcd_updown_top_tb.");
        $stop;
    end

endmodule