`timescale 1ns/1ps
module bcd_updown_top (
    input  wire        CLK,
    input  wire [4:0]  SW,
    input  wire        BTN1,
    input  wire        BTN0,
    output wire [7:0]  AN,
    output wire [6:0]  SEG,
    output wire [12:0] LED
);
    wire rst_n = ~BTN0;      
    reg btn1_d;
    always @(posedge CLK) btn1_d <= BTN1;

    reg dir;                
    always @(posedge CLK or negedge rst_n) begin
        if (!rst_n) dir <= 1'b1;           
        else if ( BTN1 & ~btn1_d ) dir <= ~dir;
    end

    wire tick;
    tick_generator u_tick (
        .clk (CLK), .rst_n(rst_n), .sw(SW), .tick(tick)
    );

    wire [3:0] units, tens;
    dual_bcd_counter u_counter (
        .clk(CLK), .rst_n(rst_n), .tick(tick), .dir(dir),
        .units(units), .tens(tens)
    );

    sevenseg_driver u_sevenseg (
        .clk(CLK), .rst_n(rst_n),
        .units(units), .tens(tens),
        .SEG(SEG), .AN(AN[1:0])
    );
    assign AN[7:2] = 6'b111111; 

    assign LED[3:0]  = units;
    assign LED[7:4]  = tens;
    assign LED[12:8] = {3'b000, SW}; 
endmodule