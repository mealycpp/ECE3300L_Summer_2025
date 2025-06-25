`timescale 1ns / 1ps
module tb_decoder4x16;

reg  [3:0] W;
reg        I;
wire [15:0] O;
// instatiation of vars
decoder4x16_behav uut (
  .W(W), .I(I), .O(O)
);

integer i;

initial begin
    $display("This is open of Test Bench");

    // block for enable on
    I = 1;
    for (i = 0; i < 16; i = i + 1) begin
        W = i;
        #10;
        if (O !== (1 << i)) begin
          $fatal("FAIL: W = %b, Expected O = %b, Got O = %b", W, (1 << i), O);
        end else begin
            $display("PASS: W = %b -> O = %b", W, O);
        end
    end

    // block for enable off
    I = 0;
    for (i = 0; i < 16; i = i + 1) begin
        W = i;
        #10;
        if (O !== 16'b0) begin
          $fatal("FAIL (disabled): W = %b, Expected O = 0, Got O = %b", W, O);
        end else begin
          $display("PASS (disabled): W = %b -> O = %b", W, O);
        end
    end
//if display here reaches, debugging is simply errors in code not catch issues
  $display("term");
    $stop;
end

endmodule
