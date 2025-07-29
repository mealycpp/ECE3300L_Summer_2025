

module top_lab6_tb(
    );

reg clk;
reg rst_n;
reg [8:0]sw;
wire[7:0]led;
wire[7:0]an;
wire[6:0]seg;
wire DP;

wire [5:0]debug_res = 

top_lab6 uut(
.clk(clk),
.rst_n(rst_n),
.sw(sw),
.led(led),
.an(an),
.seg(seg),
.DP(DP)
);
initial clk = 0;
always #5 clk = ~clk;

initial begin
//
   sw = 0;
   rst_n = 1;
   #10;
   rst_n = 0;
   #10;
   rst_n = 1;
   //increment up for 80ns initially, then test switch 6 (result = 0;)
   #80;
   sw[6:5] = 2'b10;
   #10;
   sw[6:5] = 2'b11;
   #10;
   sw[6:5] = 0;
   //set only one digit to increment(other decrement), test addition and subtraction
   #10
   sw[8] = 1; //test adding 
   #100
   sw[5] = 1; //test subtracting
   #100
    $finish;
end
endmodule
