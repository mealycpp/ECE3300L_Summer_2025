`timescale 1ns/1ps

module tb_decoder4x16;
  reg  [3:0] SW;
  reg        EN;
  wire [15:0] LED;
  integer    i;

  decoder4x16_behav test (
    .SW(SW),
    .EN(EN),
    .LED(LED)
  );

  initial begin
    // 1) Test decoding (EN=1)
    EN = 1;
    for (i = 0; i < 16; i = i + 1) begin
      SW = i; 
      #10;
      if (LED !== (16'b1 << i)) begin
        $display("FAIL: SW=%b, LED=%b (expected %b)", SW, LED, (16'b1 << i));
        $fatal;
      end else begin
        $display("PASS: SW=%b, LED=%b", SW, LED);
      end
    end

    // 2) Test disable (EN=0)
    EN = 0; 
    SW = 4'b1010; 
    #10;
    if (LED !== 16'b0) begin
      $display("FAIL: EN=0, LED=%b (expected all 0s)", LED);
      $fatal;
    end else begin
      $display("PASS: EN=0, all LEDs off");
    end

    $finish;
  end
endmodule

