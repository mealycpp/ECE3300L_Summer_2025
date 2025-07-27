module top_lab6(
input CLK,
input BTN0,
input  [8:0]  SW,        
output [7:0]  LED,
output [7:0] AN,
output [6:0] SEG 
);
wire [31:0] cnt;
wire clk_out;  
clock_divider u_div(
.clk(CLK),
.BTN0(!BTN0),
.sel(SW[4:0]),
.clk_div(clk_out),
.cnt(cnt)
);
 wire [3:0] unit_bcd, tens_bcd, control_display;
 wire roll;
  bcd_counter bcd_count_ones(
  .clk_div(clk_out),
  .BTN0(!BTN0),
  .dir_bit(SW[7]),
  .BCD(unit_bcd)
  );
  bcd_counter bcd_count_tens(
  .clk_div(clk_out),
  .BTN0(!BTN0),
  .dir_bit(SW[8]),
  .BCD(tens_bcd)
  );
wire [7:0] alu_result;
wire [3:0] ctrl_nibble = SW[8:5];
alu alu1(
.A(unit_bcd),
.B(tens_bcd),
 .ctrl({SW[6], SW[5]}),
.result(alu_result)
);
control_decoder dec(
 .clk_div(clk_out),
 .BTN0(!BTN0),
.SW(SW[8:5]),
.ctrl_nibble(control_nibble)
);
wire [3:0] scan_AN;
    seg7_scan u_scan (
    .clk(CLK),
    .BTN0(!BTN0),
    .digit0(alu_result[3:0]),
    .digit1(alu_result[7:4]),
    .digit2(ctrl_nibble),
    .SEG(SEG),
    .AN(scan_AN) 
    );
    // LEDs
  assign LED[3:0] = unit_bcd;
  assign LED[7:4] = tens_bcd;
  assign AN = { 5'b11111, scan_AN[2:0] };  
endmodule 
