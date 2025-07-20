`timescale 1ns / 1ps

module mux32x1_tb();
    // Test signals
    reg [31:0] cnt = 32'hA5A5A5A5;  // Test pattern (alternating 1010 0101)
    reg [4:0] sel = 0;
    wire clk_out;
    
    // Instantiate DUT
    mux32x1 dut (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
    );

    // Main test sequence
    initial begin
        $display("Starting mux32x1 testbench...");
        
        // Test 1: Verify all selector positions
        for (integer i=0; i<32; i=i+1) begin
            sel = i;
            #10;
            if (clk_out !== cnt[i]) begin
                $error("FAIL: sel=%d, expected %b, got %b", 
                      i, cnt[i], clk_out);
                $finish;
            end
            $display("PASS: sel=%d, out=%b", i, clk_out);
        end
        
        // Test 2: Change pattern and verify
        cnt = 32'h12345678;  // New test pattern
        #10;
        for (integer i=0; i<32; i=i+1) begin
            sel = i;
            #10;
            if (clk_out !== cnt[i]) begin
                $error("FAIL: sel=%d, expected %b, got %b",
                      i, cnt[i], clk_out);
                $finish;
            end
        end
        
        $display("All mux32x1 tests passed!");
        $finish;
    end
endmodule