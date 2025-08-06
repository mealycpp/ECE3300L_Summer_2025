`timescale 1ns / 1ps
module debounce_toggle_tb;
  // inputs to DUT
  reg        clk_1kHz;
  reg        btn_raw;
  // output from DUT
  wire       btn_toggle;

  // instantiate DUT
  debounce_toggle uut (
    .clk_1kHz(clk_1kHz),
    .btn_raw(btn_raw),
    .btn_toggle(btn_toggle)
  );

  // generate a 1 kHz clock (period = 1 ms = 1000 ns)
  initial clk_1kHz = 0;
  always #200 clk_1kHz = ~clk_1kHz;

  // inject a couple of manual glitches
  initial begin
    // start released
    btn_raw = 0;
    // wait for a few cycles
    #20;
    // first glitch
    #10  btn_raw = 1;
    #20   btn_raw = 0;
    // stable press
    #20 btn_raw = 1;
    // release after debounce window
    #30  btn_raw = 0;
    // second glitch
    #20  btn_raw = 1;
    #5   btn_raw = 0;
  end

endmodule
