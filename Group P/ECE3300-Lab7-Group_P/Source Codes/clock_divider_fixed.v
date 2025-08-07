// clock_divider_fixed.v
module clock_divider_fixed(
    input wire clk,                                 // clk
    input wire rst,                                 // rst
    output wire clk_1kHz,                           // 1kHz clk
    output wire clk_2Hz                             // 2kHz clk
);

    // Parameters
    parameter DIV_1KHZ = 50000;                     //
    parameter DIV_2HZ = 25000000;                   //

    // Registers for 1kHz clock divider
    reg [15:0] cnt1k = 0;                           //
    reg clk1k = 0;                                  //
    
    // Registers for 2Hz clock divider
    reg [25:0] cnt2 = 0;                            //
    reg clk2 = 0;                                   //

    // Clock divider for 1kHz output
    always @(posedge clk or posedge rst) begin
        if (rst) begin                              //
            cnt1k <= 0;                             //
            clk1k <= 0;                             //
        end else if (cnt1k == DIV_1KHZ-1) begin
            cnt1k <= 0;
            clk1k <= ~clk1k;                        // Toggle clk1k every DIV_1KHZ cycles
        end else begin
            cnt1k <= cnt1k + 1;
        end
    end

    // Clock divider for 2Hz output
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt2 <= 0;
            clk2 <= 0;
        end else if (cnt2 == DIV_2HZ-1) begin
            cnt2 <= 0;
            clk2 <= ~clk2;                          // Toggle clk2 every DIV_2HZ cycles
        end else begin
            cnt2 <= cnt2 + 1;
        end
    end

    // Assign internal clock signals to output ports
    assign clk_1kHz = clk1k;
    assign clk_2Hz = clk2;
endmodule
