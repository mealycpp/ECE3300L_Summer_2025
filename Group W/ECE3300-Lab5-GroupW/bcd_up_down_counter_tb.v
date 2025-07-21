module bcd_up_down_counter_tb(
    
    );
    reg clk;
    reg rst;
    reg direction;
    wire [3:0] ones;
    wire [3:0] tens;
    
    bcd_up_down_counter cntr(
            .clk_div(clk),
            .rst_n(rst),
            .dir(direction),
            .digit0(ones),
            .digit1(tens)
            );
            
    always #5 clk = ~clk;
    
    initial
        begin
            clk = 0;
            rst = 0;
            direction = 0;
            #100;
            direction = 1;
            #100
            rst = 1;
            direction = 0;
            #100;
            direction = 1;
            #100
            $finish;
        end
endmodule
