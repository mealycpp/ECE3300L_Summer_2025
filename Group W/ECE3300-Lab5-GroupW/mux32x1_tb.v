module mux32x1_tb(
    );
    
    reg [31:0] count;
    reg [4:0] select;
    wire out;
    mux32x1 TBX (
           .cnt(count),
          .sel(select),
          .clk_out(out)
            );
            integer i;
            initial
                begin
                    count = 32'd1;
                    select = 0;
                #20
            for (i = 0; i < 32; i = i + 1) begin
                    
                    select = i;
                    #20
                    count = ~count;
                    #20
                    count = ~count;
                    #20
                    count = count << 1;
                    end

            $finish;
    end
endmodule
