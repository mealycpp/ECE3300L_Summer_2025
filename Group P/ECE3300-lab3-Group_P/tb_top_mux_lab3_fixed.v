`timescale 1ns / 1ps

module tb_top_mux_lab3();

    // Inputs
    reg clkFromBoard = 0;
    reg resetButtonActiveHigh = 0;
    reg [15:0] physicalSwitchInputs = 0;
    reg upBtn = 0, downBtn = 0, leftBtn = 0, rightBtn = 0;

    // Output
    wire singleLEDOutput;

    // Instantiate the top-level module
    top_module_mux_lab3 dut (
        .clkFromBoard(clkFromBoard),
        .resetButtonActiveHigh(resetButtonActiveHigh),
        .physicalSwitchInputs(physicalSwitchInputs),
        .upBtn(upBtn),
        .downBtn(downBtn),
        .leftBtn(leftBtn),
        .rightBtn(rightBtn),
        .singleLEDOutput(singleLEDOutput)
    );

    // Clock generator: 100 MHz
    always #5 clkFromBoard = ~clkFromBoard;

    // Main test
    initial begin
        $display("Starting MUX testbench...");

        // Initial reset
        resetButtonActiveHigh = 1;
        #30;
        resetButtonActiveHigh = 0;

        // Set known switch pattern
        physicalSwitchInputs = 16'b0000_0000_0000_1000; // Only input[3] = 1

        // Press buttons to toggle sel = 4'b0011
            downBtn = 1;
            #30; // Hold for 30 ns
            downBtn = 0;
            #30; // Wait for debounce to reset
            
            rightBtn = 1;
            #30; // Hold for 30 ns
            rightBtn = 0;
            #30; // Wait for debounce to reset

        // Wait for output to stabilize
        #50;
        
        if (singleLEDOutput !== 1'b1)
            $display("FAIL: Expected LED to be ON for input[3], got %b", singleLEDOutput);
        else
            $display("PASS: Correct output"); 
        
        //reset for next input
        resetButtonActiveHigh = 1;
        #30;
        resetButtonActiveHigh = 0;
        
         // Set known switch pattern
        physicalSwitchInputs = 16'b0001_0000_0000_0000; // Only input[12] = 1

        // Press buttons to toggle sel = 4'b1100
            upBtn = 1;
            #30; // Hold for 30 ns
            upBtn = 0;
            #30; // Wait for debounce to reset
            
            leftBtn = 1;
            #30; // Hold for 30 ns
            leftBtn = 0;
            #30; // Wait for debounce to reset

        // Wait for output to stabilize
        #50;
        
        if (singleLEDOutput !== 1'b1)
            $display("FAIL: Expected LED to be ON for input[3], got %b", singleLEDOutput);
        else
            $display("PASS: Correct output"); 
        
        //reset for next input
        resetButtonActiveHigh = 1;
        #30;
        resetButtonActiveHigh = 0;
        
         // Set known switch pattern
        physicalSwitchInputs = 16'b1000_0000_0000_0000; // Only input[15] = 1

        // Press buttons to toggle sel = 4'b1111
            upBtn = 1;
            #30; // Hold for 30 ns
            upBtn = 0;
            #30; // Wait for debounce to reset
            
            downBtn = 1;
            #30; // Hold for 30 ns
            downBtn = 0;
            #30; // Wait for debounce to reset
            
            leftBtn = 1;
            #30; // Hold for 30 ns
            leftBtn = 0;
            #30; // Wait for debounce to reset
            
            rightBtn = 1;
            #30; // Hold for 30 ns
            rightBtn = 0;
            #30; // Wait for debounce to reset

        // Wait for output to stabilize
        #50;
        
        if (singleLEDOutput !== 1'b1)
            $display("FAIL: Expected LED to be ON for input[3], got %b", singleLEDOutput);
        else
            $display("PASS: Correct output"); 
        
        //reset for next input
        resetButtonActiveHigh = 1;
        #30;
        resetButtonActiveHigh = 0;
        #30;
        $finish;
    end

endmodule
