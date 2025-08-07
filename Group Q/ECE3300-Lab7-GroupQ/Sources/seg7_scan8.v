module seg7_scan8(
    input clk, rst,
    input [15:0] value,
    output reg [6:0] seg,
    output reg [7:0] an
);
    reg [2:0] scan = 0;
    wire [3:0] nibble;
    assign nibble = (scan==0)?value[3:0]:
                    (scan==1)?value[7:4]:
                    (scan==2)?value[11:8]:
                               value[15:12];
    wire [6:0] seg_code;
    hex_to_7seg h2s(nibble, seg_code);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            scan <= 0; an <= 8'hFF;
        end else begin
            scan <= scan + 1;
            an <= 8'hFF;
            an[scan] <= 0;  // active low
            seg <= seg_code;
        end
    end
endmodule