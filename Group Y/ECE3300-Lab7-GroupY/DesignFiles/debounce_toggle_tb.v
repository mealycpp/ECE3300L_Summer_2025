`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 10:15:36 PM
// Design Name: 
// Module Name: debounce_toggle_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce_toggle_tb;
    reg clk;
    reg rst;
    reg btn_raw;
    wire state;
    toggle uut (
        .clk(clk),
        .rst(rst),
        .btn_raw(btn_raw),
        .state(state)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    task simulate_bounce;
        input level;           // desired steady state after bounce (0 or 1)
        input [3:0] count;     // glitch amt
        integer i;
        begin
            for (i = 0; i < count; i = i + 1) begin
                btn_raw = ~level;
                #7;
                btn_raw = level;
                #13;
            end
        end
    endtask

    initial begin
        rst = 0;
        btn_raw = 0;
        #20;
        rst = 1;

        $display("Time\t\tbtn_raw\tstate");
        $monitor("%0t\t%b\t%b", $time, btn_raw, state);

        #50;

        // Simulate a noisy button press (with bounce)
        $display("Press with bounce...");
        simulate_bounce(1, 5);  // 5 rising glitches
        btn_raw = 1;           
        #500;
        btn_raw = 0;          
        #500;
        
        $display("Press again with bounce...");
        simulate_bounce(1, 3);
        btn_raw = 1;
        #500;
        btn_raw = 0;
        #500;

        $display("Clean press...");
        btn_raw = 1;
        #500;
        btn_raw = 0;
        #500;

        $stop;
    end

endmodule

