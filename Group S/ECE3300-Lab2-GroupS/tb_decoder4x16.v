`timescale 1ns / 1ps

module tb_decoder4x16;

reg  [3:0] A;
reg        E;
wire [15:0] Y;


decoder4x16_behav test(.A(A), .E(E), .Y(Y));   // instantiating with behavioral model


integer i;

initial begin

   // Check that outputs stay LOW when disabled 
    E = 1'b0;
    A = 4'b0000;
    #10;
    if (Y !== 16'b0) $fatal(1, "FAIL: Y not zero when E=0"); // if Y is not 0, print error message
    $display("PASS: E=0 forces Y=0");

    //all 16 input patterns with enable HIGH 
    E = 1'b1; // set Enable on
   // looping through possible input values
    for (i = 0; i < 16; i = i + 1) begin
        A = i[3:0];
        #10; // 10 unit delay
        if (Y !== (16'b1 << i)) // checking if output Y is not equal to the correct value according to corresponding A input. (ex. A = 0x0, Y = 0x0001)
        //if not, print error
            $fatal(1,
                "FAIL: A=%0h  expected=%016b  got=%016b",
                A, (16'b1 << i), Y
            );
    end
    $display("PASS: All 16 combinations decoded correctly");

   // display message that all tests passed
    $display("\nALL TESTS PASSED\n");
    $finish;
end

endmodule
