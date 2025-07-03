`timescale 1ns / 1ps

module Tb_top_mux;

  reg clk = 0;
  reg [15:0] SW = 0;
  reg reset = 0;
  reg btnU = 0, btnD = 0, btnL = 0, btnR = 0;
  wire LED0;

  top_mux_lab3 DUT (
    .clk(clk),
    .rst(reset),
    .SW(SW),
    .btnU(btnU),
    .btnD(btnD),
    .btnL(btnL),
    .btnR(btnR),
    .LED0(LED0)
  );

  always #5 clk = ~clk;  // 100 MHz clock

  // Button press tasks (40ns pulse)
  task press_btnD(); begin btnD = 1; #40; btnD = 0; #40; end endtask
  task press_btnR(); begin btnR = 1; #40; btnR = 0; #40; end endtask
  task press_btnL(); begin btnL = 1; #40; btnL = 0; #40; end endtask
  task press_btnU(); begin btnU = 1; #40; btnU = 0; #40; end endtask

  // Select bits by toggling buttons based on value
  task select_value(input [3:0] value);
    begin
      reset = 1; #40; reset = 0;

      if (value[0]) press_btnD();
      if (value[1]) press_btnR();
      if (value[2]) press_btnL();
      if (value[3]) press_btnU();
    end
  endtask

  integer i;

  initial begin
    SW = 16'b0;
    reset = 0;
    btnU = 0; btnD = 0; btnL = 0; btnR = 0;

    for (i = 0; i < 16; i = i + 1) begin
      SW = 16'b1 << i;  // Set only one bit high
      select_value(i[3:0]);
      #100;

      $display("Testing sel=%0d, SW=%b, LED0=%b", i, SW, LED0);
      if (LED0 !== SW[i])
        $fatal(" Mismatch at sel=%0d: expected %b", i, SW[i]);
    end

    $display(" All tests passed.");
    $finish;
  end

endmodule
