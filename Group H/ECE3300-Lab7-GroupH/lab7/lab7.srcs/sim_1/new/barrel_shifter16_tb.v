`timescale 1ns / 1ps

module barrel_shifter16_tb;

    reg [15:0] data_in;
    reg [3:0]  shamt;
    reg        dir;
    reg        rotate;

    wire [15:0] data_out;

    reg [15:0] expected_out;
    integer    error_count = 0;
    integer    i;

    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    initial begin
        $display("Starting barrel_shifter16_tb...");
        data_in = 16'hF0CD; 
        
        for (dir = 0; dir <= 1; dir = dir + 1) begin
            for (rotate = 0; rotate <= 1; rotate = rotate + 1) begin
                for (i = 0; i < 16; i = i + 1) begin
                    shamt = i;
                    #10; 

                    if (dir == 0) begin 
                        if (rotate == 0) begin 
                            expected_out = data_in << shamt;
                        end else begin 
                            expected_out = (data_in << shamt) | (data_in >> (16 - shamt));
                        end
                    end else begin 
                        if (rotate == 0) begin 
                            expected_out = data_in >> shamt;
                        end else begin 
                            expected_out = (data_in >> shamt) | (data_in << (16 - shamt));
                        end
                    end

                    if (data_out !== expected_out) begin
                        $display("ERROR! data_in=%h, shamt=%d, dir=%b, rot=%b", data_in, shamt, dir, rotate);
                        $display("  Expected: %h, Got: %h", expected_out, data_out);
                        error_count = error_count + 1;
                    end
                end
            end
        end

        if (error_count == 0) begin
            $display("SUCCESS! All tests passed for data_in = %h.", data_in);
        end else begin
            $display("FAILURE! Found %d errors.", error_count);
        end
        
        $finish;
    end

endmodule
