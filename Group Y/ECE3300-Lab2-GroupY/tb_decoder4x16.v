module tb_decoder4x16();
    reg [4:0] sw;
    wire [15:0] led;

    // Instantiate  DUT 
    decoder4x16_behav uut (.sw(sw), .led(led));
    // decoder4x16_gate uut (.sw(sw), .led(led));

    integer i;

    initial begin
        $display("Starting testbench...");

        // Test when Enable = 0
        sw[4] = 4'd0;
        for (i = 0; i < 16; i = i + 1) begin
            sw[3:0] = i;
            #10;
            if (led !== 16'b0) begin
                $display("FAIL: sw[4]=0, sw[3:0]=%b → led=%b (should be all 0)", sw[3:0], led);
                //$fatal;
            end else begin
                $display("PASS: sw[4]=0, sw[3:0]=%b → led=%b", sw[3:0], led);
            end
        end

        // Test when Enable = 1
        sw[4] = 4'd1;
        for (i = 0; i < 16; i = i + 1) begin
            sw[3:0] = i;
            #10;
            if (led !== (16'b1 << i)) begin
                $display("FAIL: sw[4]=1, sw[3:0]=%b → led=%b (expected %b)", sw[3:0], led, (16'b1 << i));
                $fatal;
            end else begin
                $display("PASS: sw[4]=1, sw[3:0]=%b → led=%b", sw[3:0], led);
            end
        end

        $display("Tests Successful");
        $finish;
    end
endmodule