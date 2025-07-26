`timescale 1ns / 1ps

module mux32x1_tb;

    // Testbench signals
    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;

    // Instantiate the Unit Under Test (UUT)
    mux32x1 uut (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
    );

    integer i;

    initial begin
        // Display headers
        $display("Time\tSel\tcnt[Sel]\tclk_out");
        $monitor("%0dns\t%0d\t%b\t\t%b", $time, sel, cnt[sel], clk_out);

        // Set initial cnt pattern: 101010... (binary)
        cnt = 32'b10101010101010101010101010101010;

        // Wait 10 ns for setup
        #10;

        // Loop through all possible 5-bit sel values (0 to 31)
        for (i = 0; i < 32; i = i + 1) begin
            sel = i;
            #5;  // Wait to observe output
        end

        // Finish simulation
        $finish;
    end

endmodule
