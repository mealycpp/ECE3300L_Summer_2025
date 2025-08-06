`timescale 1ns / 1ps

module barrel_shifter16_tb();
    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir;
    reg rotate;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .DATA_IN(data_in),
        .SHAMT(shamt),
        .DIR(dir),
        .ROTATE(rotate),
        .DATA_OUT(data_out)
    );

    initial begin
        data_in = 16'hA5A5;

        for (dir = 0; dir <= 1; dir = dir + 1) begin
            for (rotate = 0; rotate <= 1; rotate = rotate + 1) begin
                for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
                    #10;
                end
            end
        end

        data_in = 16'h8001;

        for (dir = 0; dir <= 1; dir = dir + 1) begin
            for (rotate = 0; rotate <= 1; rotate = rotate + 1) begin
                for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
                    #10;
                end
            end
        end

        #20;
        $finish;
    end
endmodule
