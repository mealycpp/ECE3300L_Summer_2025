`timescale 1ns / 1ps

module tb_control_decoder;

    // Inputs
    reg [3:0] control_switches;

    // Outputs
    wire [3:0] ctrl_nibble;

    // Instantiate the Unit Under Test (UUT)
    control_decoder uut (
        .control_switches(control_switches),
        .ctrl_nibble(ctrl_nibble)
    );

    // Stimulus
    initial begin

        // Apply different switch values
        control_switches = 4'b0000; #10;
        control_switches = 4'b0001; #10;
        control_switches = 4'b0010; #10;
        control_switches = 4'b0101; #10;
        control_switches = 4'b1010; #10;
        control_switches = 4'b1111; #10;

        // Finish simulation
        #10;
        $finish;
    end

endmodule
