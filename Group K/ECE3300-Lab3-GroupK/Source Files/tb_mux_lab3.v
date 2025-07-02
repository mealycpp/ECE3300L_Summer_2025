`timescale 1ns / 1ps

module tb_top_mux_lab3;

  // DUT inputs
  reg clk = 0;
  reg rst = 1;
  reg [15:0] SW = 16'b0;
  reg btnU = 0, btnD = 0, btnL = 0, btnR = 0;

  // DUT outputs
  wire LED0;
  wire [3:0] debug_sel;

  // Instantiate the DUT
  top_mux_lab3 dut (
    .clk(clk),
    .rst(rst),
    .SW(SW),
    .btnU(btnU),
    .btnD(btnD),
    .btnL(btnL),
    .btnR(btnR),
    .LED0(LED0),
    .debug_sel(debug_sel)
  );

  // 100 MHz clock
  always #5 clk = ~clk;

  // Task to press a button (held for 4 clock cycles to pass debounce)
  task press(input integer dir);
    begin
      case (dir)
        0: btnD = 1;
        1: btnR = 1;
        2: btnL = 1;
        3: btnU = 1;
      endcase
      repeat (4) @(posedge clk);  // held high for 4 clocks
      case (dir)
        0: btnD = 0;
        1: btnR = 0;
        2: btnL = 0;
        3: btnU = 0;
      endcase
      repeat (2) @(posedge clk);  // debounce low time
    end
  endtask

  // Task to set the select bits to a target value using toggle switches
  task set_sel(input [3:0] target);
    begin
      if (debug_sel[0] !== target[0]) press(0); // btnD
      if (debug_sel[1] !== target[1]) press(1); // btnR
      if (debug_sel[2] !== target[2]) press(2); // btnL
      if (debug_sel[3] !== target[3]) press(3); // btnU (MSB)
    end
  endtask

  // Main test
  integer i;
  initial begin
    // Apply reset
    repeat (4) @(posedge clk);
    rst = 0;

    // Test each select value 0-15
    for (i = 0; i < 16; i = i + 1) begin
      // Set only SW[i] = 1, rest = 0
      SW = 16'b0;
      SW[i] = 1'b1;

      // Use buttons to set sel = i
      set_sel(i[3:0]);

      // Wait for MUX to propagate
      repeat (4) @(posedge clk);

      // Check if LED0 matches SW[i]
      if (LED0 !== 1'b1)
        $fatal(1, "❌ FAIL: SEL=%0d | Expected LED0=1 (SW[%0d]), got %b", i, i, LED0);
      else
        $display("✅ PASS: SEL=%0d | LED0 = SW[%0d] = 1", i, i);
    end

    $display("🎉 All 16 select values tested successfully.");
    $finish;
  end

endmodule
