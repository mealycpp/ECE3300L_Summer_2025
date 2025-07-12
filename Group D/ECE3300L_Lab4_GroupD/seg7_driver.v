`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 04:14:24 PM
// Design Name: 
// Module Name: seg7_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
module seg7_driver(
  input        clk,
  input        rst_n,
  input  [15:0] SW,       // Eight 4-bit values
  output reg [6:0] Cnode, // Segments a–g (active low)
  output       dp,        // Decimal point (tie-off)
  output  [7:0] AN,        // Digit enables (active low)
  output  [15:0] LED
);

  // 1. Scan counter for ~200 Hz digit rate
  reg [19:0] cnt;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) cnt <= 0;
    else        cnt <= cnt + 1;
  wire [2:0] scan = cnt[19:17];

  // 2. Pick the current 4-bit nibble
  reg [3:0] digit;
  always @(*) begin
    case (scan)
      3'd0: digit = SW[3:0];
      3'd1: digit = SW[7:4];
      3'd2: digit = SW[11:8];
      3'd3: digit = SW[15:12];
      3'd4: digit = SW[3:0];
      3'd5: digit = SW[7:4];
      3'd6: digit = SW[11:8];
      3'd7: digit = SW[15:12];
      default: digit = 4'd0;
    endcase
  end

  // 3. 4-bit → 7-segment (common-anode, active-low)
  always @(*) begin
    case (digit)
      4'd0:  Cnode = 7'b0000001;
      4'd1:  Cnode = 7'b1001111;
      4'd2:  Cnode = 7'b0010010;
      4'd3:  Cnode = 7'b0000110;
      4'd4:  Cnode = 7'b1001100;
      4'd5:  Cnode = 7'b0100100;
      4'd6:  Cnode = 7'b0100000;
      4'd7:  Cnode = 7'b0001111;
      4'd8:  Cnode = 7'b0000000;
      4'd9:  Cnode = 7'b0001100;
      4'd10: Cnode = 7'b0001000;
      4'd11: Cnode = 7'b1100000;
      4'd12: Cnode = 7'b0110001;
      4'd13: Cnode = 7'b1000010;
      4'd14: Cnode = 7'b0110000;
      4'd15: Cnode = 7'b0111000;
      default: Cnode = 7'b1111111;
    endcase
  end

  // 4. Decimal point always off
  assign dp = 1'b1;

  // 5. Enable one AN at a time (active-low)
  reg [7:0] AN_tmp;
  always @(*) begin
    AN_tmp = 8'hFF;
    AN_tmp[scan] = 1'b0;
  end
  assign AN = AN_tmp;
  assign LED = SW;
endmodule
