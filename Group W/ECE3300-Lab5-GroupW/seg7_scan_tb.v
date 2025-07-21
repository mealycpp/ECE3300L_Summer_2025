module seg7_scan_tb (
);

  reg clk_tb, rst_n_tb;
  reg [3:0] digit0_tb, digit1_tb;
  wire [6:0] SEG_tb;
  wire [7:0] AN_tb;

  seg7_scan tb (
    .clk(clk_tb),
    .rst_n(rst_n_tb),
    .digit0(digit0_tb),
    .digit1(digit1_tb),
    .SEG(SEG_tb),
    .AN(AN_tb)
  );

  always #5 clk_tb = ~clk_tb;

  task check_output;
    $display("Time = %0t, AN =%b, SEG = %b", $time, AN_tb, SEG_tb);
  endtask

  initial
      begin
        clk_tb = 0;
        rst_n_tb = 0;
        digit0_tb = 4'd1;
        digit1_tb = 4'd1;
        #40

        rst_n_tb = 1;
        repeat (5)
          begin
            @(posedge clk_tb);
            check_output;
          end

        digit0_tb = 4'd5;
        digit1_tb = 4'd5;
        #40
        repeat(5) 
          begin
            @(posedge clk_tb);
            check_output;
          end

        $finish;

      end
endmodule
