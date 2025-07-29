module top_lab6(
    input CLK,
    input [8:0] SW,       // SW[8]: tens dir, SW[7]: units dir, SW[6:5]: ALU, SW[4:0]: speed
    input BTN0,
    output [6:0] SEG,
    output [7:0] AN,
    output [7:0] LED
);
    wire rst_n = ~BTN0;
    wire [31:0] count;
    wire clk_div;
    wire [3:0] units, tens;
    wire [7:0] result;
    wire [3:0] ctrl_nibble;

    // ALU display result
    reg [3:0] result_units, result_tens;

    // Clock divider with mux
    clock_divider u_clk (
        .clk(CLK),
        .rst_n(rst_n),
        .sel(SW[4:0]),
        .count(count),
        .clk_div(clk_div)
    );

    // Counters
    bcd_counter u_counter (.clk(clk_div), .rst_n(rst_n), .dir(SW[7]), .bcd(units));
    bcd_counter t_counter (.clk(clk_div), .rst_n(rst_n), .dir(SW[8]), .bcd(tens));

    // ALU logic
    alu u_alu (.A(tens), .B(units), .ctrl(SW[6:5]), .result(result));

    // split into tens and units
    always @(*) begin
        result_units = result % 10;
        result_tens  = result / 10;
    end

    // Control nibble display
    control_decoder u_ctrl (.sw(SW[8:5]), .ctrl_nibble(ctrl_nibble));

    // 7-segment scanner
    seg7_scan u_seg (
        .clk(CLK), .rst_n(rst_n),
        .digit0(result_units),
        .digit1(result_tens),
        .digit2(ctrl_nibble),
        .an(AN), .seg(SEG)
    );

    // LED debug
    assign LED[3:0] = units;
    assign LED[7:4] = tens;
endmodule
