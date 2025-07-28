`timescale 1ns / 1ps

module seg7_scan_tb();
  reg clk = 0;
  reg rst_n;
  reg [3:0] lower_digit;
  reg [3:0] upper_digit;
  reg [3:0] ctrl_nibble;
 
  wire [6:0] seg;
  wire [2:0] an;
  
  seg7_scan uut (
    .clk(clk),
    .rst_n(rst_n),
    .lower_digit(lower_digit),
    .upper_digit(upper_digit),
    .ctrl_nibble(ctrl_nibble),
    .seg(seg),
    .an(an)
  );
  
  always #5 clk = ~clk;

  initial begin
        rst_n = 0;
        lower_digit = 4'd3;
        upper_digit = 4'd1;
        ctrl_nibble = 4'd5;

        #20 rst_n = 1;

        #2000;
        
        lower_digit = 4'd9;
        upper_digit = 4'd4;
        ctrl_nibble = 4'd0;

        #2000;

        $finish;
    end

endmodule
