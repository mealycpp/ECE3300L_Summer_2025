`timescale 1ns / 1ps


module bcd_counter_tb;  
    reg clk_div = 0;
    reg reset_n = 0;
    reg dir_bit;
    wire [3:0] bcd_out;

    bcd_counter uut (
        .clk_div(clk_div),
        .reset_n(reset_n),
        .dir_bit(dir_bit),
        .bcd_out(bcd_out)
    );
    
 // Clock generator
    always #5 clk_div = ~clk_div;

    initial begin
        $monitor("Time: %0t | Reset: %b | Dir: %b | BCD: %d", $time, reset_n, dir_bit, bcd_out);
        
        // Test reset
        reset_n = 0; dir_bit = 1; #20;
        reset_n = 1;              #20;

        // Count up
        repeat (11) #10;

        // Count down
        dir_bit = 0;
        repeat (11) #10;

        $finish;
    end
    
endmodule
