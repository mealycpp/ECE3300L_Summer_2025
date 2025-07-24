  control_decoder uut (
    .ctrl_in(ctrl_in),
    .ctrl_nibble(ctrl_nibble)
  );

  initial begin
    ctrl_in = 4'b0000; #10;
    ctrl_in = 4'b1010; #10;
    ctrl_in = 4'b1111; #10;
    $stop;
  end
endmodule
