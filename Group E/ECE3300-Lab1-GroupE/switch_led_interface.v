module switch_led_interface(
    input wire [15:0] sw,  // declaration of 16 bit wide input named sw of data type wire
    output wire [15:0] led // declaration of 16 bit wide output named led of data type wire
    );
    
    assign led = sw; 
    
endmodule
