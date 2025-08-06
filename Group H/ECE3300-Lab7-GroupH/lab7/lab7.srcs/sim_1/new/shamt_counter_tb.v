`timescale 1ns / 1ps

module shamt_counter_tb;

    reg clk_1kHz = 0;
    reg btn_tick;

    wire [1:0] shamt_high;

    shamt_counter uut (
        .clk_1kHz(clk_1kHz),
        .btn_tick(btn_tick),
        .shamt_high(shamt_high)
    );

    always #500_000 clk_1kHz = ~clk_1kHz;
    task generate_tick;
        begin
            #1_000_000; 
            btn_tick = 1;
            #1_000_000;
            btn_tick = 0;
            #2_000_000; 
        end
    endtask

    initial begin
        $display("Starting shamt_counter_tb...");
        btn_tick = 0;
        #2_000_000;

        $display("Testing counter sequence 0->1->2->3->0");
        generate_tick; // shamt_high should go to 1
        generate_tick; // shamt_high should go to 2
        generate_tick; // shamt_high should go to 3
        generate_tick; // shamt_high should wrap to 0
        generate_tick; // shamt_high should go to 1 again

        $display("Simulation finished.");
        $finish;
    end
    
    initial begin
        $dumpfile("shamt_counter_tb.vcd");
        $dumpvars(0, shamt_counter_tb);
    end

endmodule
