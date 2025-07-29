`timescale 1ns / 1ps

module bcd_counter_tb;

    reg clk;
    reg rst_n;
    reg dir;
    wire [3:0] bcd_out;

    bcd_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .bcd(bcd_out)
    );

    localparam CLK_PERIOD = 20;
    always begin
        clk = 0; #(CLK_PERIOD / 2);
        clk = 1; #(CLK_PERIOD / 2);
    end

    initial begin
        $display("Starting testbench for bcd_counter...");

        // --- Test Case 1: Reset ---
        $display("\n--- Testing Reset ---");
        rst_n = 1'b0; // Apply active-low reset
        dir = 1'b1;   // Direction is 'up'
        # (CLK_PERIOD * 2);
        if (bcd_out !== 4'd0) $display("ERROR: Counter did not reset to 0.");

        rst_n = 1'b1; // Release reset
        # (CLK_PERIOD);


        // --- Test Case 2: Count Up ---
        $display("\n--- Testing Count Up (dir=1) ---");
        dir = 1'b1;
        // Let it run for 12 cycles to see it count 0->9 and wrap to 0, 1
        repeat (12) @(posedge clk);
        #5; // Wait a moment to check final value
        if (bcd_out !== 4'd2) $display("ERROR: Count up sequence failed. Expected 2, got %d", bcd_out);


        // --- Test Case 3: Count Down ---
        $display("\n--- Testing Count Down (dir=0) ---");
        rst_n = 1'b0; 
        # (CLK_PERIOD * 2);
        rst_n = 1'b1;
        # (CLK_PERIOD);

        dir = 1'b0; 
        repeat (12) @(posedge clk);
        #5;
        if (bcd_out !== 4'd8) $display("ERROR: Count down sequence failed. Expected 8, got %d", bcd_out);

        $display("\nTest complete.");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | rst_n = %b, dir = %b | bcd_out = %d", $time, rst_n, dir, bcd_out);
    end

endmodule
