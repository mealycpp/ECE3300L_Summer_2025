`timescale 1ns / 1ps
//module and dut instantiation
module seg7_scan_tb(
    );
    reg clk;
    reg rst_n;
    reg [3:0] units;
    reg [3:0] tens;
    wire [7:0] an;
    wire [6:0] seg;
    
    seg7_scan testbench(
    .clk(clk),
    .rst_n(rst_n),
    .units(units),
    .tens(tens),
    .an(an),
    .seg(seg)
    );
    //integers for for loops
    integer i,j;
    //set initial conditions for clock and reset
    initial begin 
    clk = 0;
    rst_n = 0;
    #30;
    rst_n = 1;
    end
    //clock signal
    always #5 clk =~ clk;
   
    //increment from 0 to 9 in lsb 7seg
    initial begin 
    units = 4'd0;
    for (i = 0; i < 10; i = i + 1) begin
    #10;
    units = i;
    end
    end
    //increment from 0 to 9 in msb 7seg
    initial begin
    tens = 4'd0;
     for (j = 0; j < 10; j = j + 1) begin
     #10;
     tens = j;
    end
 //end after 120ns
    #120;
    $finish;
    end
endmodule
