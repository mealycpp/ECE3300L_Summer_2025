`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// 

//////////////////////////////////////////////////////////////////////////////////


module switch_led_interface
    (
    input wire [15:0] sw,
    output wire [15:0] led
    );
    assign led = sw;
endmodule
