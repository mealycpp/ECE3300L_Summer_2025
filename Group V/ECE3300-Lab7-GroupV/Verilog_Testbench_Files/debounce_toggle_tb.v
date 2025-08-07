`timescale 1ns / 1ps



module debounce_toggle_tb(
    );
    reg clk;
    reg btn_raw;
    wire btn_toggle;

    debounce_toggle uut(
        .clk_1kHz(clk),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );


  task glitch;
    begin
        //button is pressed, but never for longer than 2.5 clock cycles
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #20;
        btn_raw = 0; #20;
        btn_raw = 1; #40;
    end
  endtask 

    task normal_press;
        begin
            //button is pressed for at least 3 clock cycles, once during one clock cycle
            //then 3 times during 5 clock cycles since it will stay on as long as btn_raw is low
            btn_raw = 0; #10;
            btn_raw = 1; #40;
            btn_raw = 0; #40;
            btn_raw = 1; #40;
            btn_raw = 0; #40;
            btn_raw = 1; #40;

        end
    endtask

initial begin
    clk = 1;
    forever #5 clk = ~clk;
end

initial begin
btn_raw = 1; #10;
btn_raw = 0; #10;
btn_raw = 1; #10;
btn_raw = 0; #10;

glitch();

#30;

normal_press();

#10;

glitch();

#20;
$finish;

end

endmodule
