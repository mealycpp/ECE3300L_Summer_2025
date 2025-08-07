`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 07:52:23 PM
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
    reg clk_tb;
    reg btn_input_tb;
    wire btn_toggle_tb;

    debounce_toggle uut (
        .clk(clk_tb),
        .btn_input(btn_input_tb),
        .btn_toggle(btn_toggle_tb)
    );

    always #5 clk_tb = ~clk_tb;

    task simulate_button_press_with_bounce;
        begin
            btn_input_tb = 1;
            #10 btn_input_tb = 0;
            #10 btn_input_tb = 1;
            #10 btn_input_tb = 0;
            #10 btn_input_tb = 1;
            // Stay stable after bouncing
            #100 btn_input_tb = 1;
            // Button release with bounce
            #20 btn_input_tb = 0;
            #10 btn_input_tb = 1;
            #10 btn_input_tb = 0;
            #10 btn_input_tb = 1;
            #10 btn_input_tb = 0;
            #100 btn_input_tb = 0;
        end
    endtask

    initial begin
        clk_tb = 0;
        btn_input_tb = 0;

        #100;

        // Simulate first button press (with bounce)
        simulate_button_press_with_bounce();

        // Wait and simulate second clean press
        #200;
        btn_input_tb = 1; #200;
        btn_input_tb = 0;

        #200;
        $finish;
    end

endmodule