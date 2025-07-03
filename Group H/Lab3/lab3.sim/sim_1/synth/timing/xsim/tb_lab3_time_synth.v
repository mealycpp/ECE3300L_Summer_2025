// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Jun 30 19:35:27 2025
// Host        : ASTROFRANK running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/verilog/ece3300l/Group
//               H/Lab3/lab3.sim/sim_1/synth/timing/xsim/tb_lab3_time_synth.v}
// Design      : top_mux_lab3
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module debounce
   (D,
    clk_IBUF_BUFG,
    \shift_reg_reg[0]_0 );
  output [0:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\shift_reg_reg[0]_0 ;

  wire [0:0]D;
  wire btn_clean_i_1_n_0;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;
  wire [0:0]\shift_reg_reg[0]_0 ;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1
       (.I0(D),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1_n_0),
        .Q(D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg_reg[0]_0 ),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_0
   (D,
    clk_IBUF_BUFG,
    \shift_reg_reg[0]_0 );
  output [0:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\shift_reg_reg[0]_0 ;

  wire [0:0]D;
  wire btn_clean_i_1__1_n_0;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;
  wire [0:0]\shift_reg_reg[0]_0 ;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__1
       (.I0(D),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__1_n_0),
        .Q(D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg_reg[0]_0 ),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_1
   (D,
    clk_IBUF_BUFG,
    \shift_reg_reg[0]_0 );
  output [0:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\shift_reg_reg[0]_0 ;

  wire [0:0]D;
  wire btn_clean_i_1__0_n_0;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;
  wire [0:0]\shift_reg_reg[0]_0 ;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__0
       (.I0(D),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__0_n_0),
        .Q(D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg_reg[0]_0 ),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_2
   (D,
    clk_IBUF_BUFG,
    \shift_reg_reg[0]_0 );
  output [0:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\shift_reg_reg[0]_0 ;

  wire [0:0]D;
  wire btn_clean_i_1__2_n_0;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;
  wire [0:0]\shift_reg_reg[0]_0 ;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__2
       (.I0(D),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__2_n_0),
        .Q(D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\shift_reg_reg[0]_0 ),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_6
   (btn_clean,
    btn_prev_reg,
    clk_IBUF_BUFG,
    btn_prev,
    LED4_OBUF,
    D);
  output btn_clean;
  output btn_prev_reg;
  input clk_IBUF_BUFG;
  input btn_prev;
  input LED4_OBUF;
  input [0:0]D;

  wire [0:0]D;
  wire LED4_OBUF;
  wire btn_clean;
  wire btn_clean_i_1__6_n_0;
  wire btn_prev;
  wire btn_prev_reg;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__6
       (.I0(btn_clean),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__6_n_0),
        .Q(btn_clean),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    state_i_1__2
       (.I0(btn_prev),
        .I1(btn_clean),
        .I2(LED4_OBUF),
        .O(btn_prev_reg));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_7
   (btn_clean,
    btn_prev_reg,
    clk_IBUF_BUFG,
    btn_prev,
    LED3_OBUF,
    D);
  output btn_clean;
  output btn_prev_reg;
  input clk_IBUF_BUFG;
  input btn_prev;
  input LED3_OBUF;
  input [0:0]D;

  wire [0:0]D;
  wire LED3_OBUF;
  wire btn_clean;
  wire btn_clean_i_1__5_n_0;
  wire btn_prev;
  wire btn_prev_reg;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__5
       (.I0(btn_clean),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__5_n_0),
        .Q(btn_clean),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    state_i_1__1
       (.I0(btn_prev),
        .I1(btn_clean),
        .I2(LED3_OBUF),
        .O(btn_prev_reg));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_8
   (btn_clean,
    btn_prev_reg,
    clk_IBUF_BUFG,
    btn_prev,
    state_reg,
    D);
  output btn_clean;
  output btn_prev_reg;
  input clk_IBUF_BUFG;
  input btn_prev;
  input state_reg;
  input [0:0]D;

  wire [0:0]D;
  wire btn_clean;
  wire btn_clean_i_1__4_n_0;
  wire btn_prev;
  wire btn_prev_reg;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;
  wire state_reg;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__4
       (.I0(btn_clean),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__4_n_0),
        .Q(btn_clean),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    state_i_1__0
       (.I0(btn_prev),
        .I1(btn_clean),
        .I2(state_reg),
        .O(btn_prev_reg));
endmodule

(* ORIG_REF_NAME = "debounce" *) 
module debounce_9
   (btn_clean,
    btn_prev_reg,
    clk_IBUF_BUFG,
    btn_prev,
    LED1_OBUF,
    D);
  output btn_clean;
  output btn_prev_reg;
  input clk_IBUF_BUFG;
  input btn_prev;
  input LED1_OBUF;
  input [0:0]D;

  wire [0:0]D;
  wire LED1_OBUF;
  wire btn_clean;
  wire btn_clean_i_1__3_n_0;
  wire btn_prev;
  wire btn_prev_reg;
  wire clk_IBUF_BUFG;
  wire [2:0]shift_reg;

  LUT4 #(
    .INIT(16'hEAA8)) 
    btn_clean_i_1__3
       (.I0(btn_clean),
        .I1(shift_reg[2]),
        .I2(shift_reg[0]),
        .I3(shift_reg[1]),
        .O(btn_clean_i_1__3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_clean_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean_i_1__3_n_0),
        .Q(btn_clean),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(shift_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[0]),
        .Q(shift_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shift_reg[1]),
        .Q(shift_reg[2]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    state_i_1
       (.I0(btn_prev),
        .I1(btn_clean),
        .I2(LED1_OBUF),
        .O(btn_prev_reg));
endmodule

module toggle_switch
   (LED1_OBUF,
    rst_active,
    clk_IBUF_BUFG,
    D);
  output LED1_OBUF;
  input rst_active;
  input clk_IBUF_BUFG;
  input [0:0]D;

  wire [0:0]D;
  wire LED1_OBUF;
  wire btn_clean;
  wire btn_prev;
  wire clk_IBUF_BUFG;
  wire db_n_1;
  wire rst_active;

  FDRE #(
    .INIT(1'b0)) 
    btn_prev_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean),
        .Q(btn_prev),
        .R(rst_active));
  debounce_9 db
       (.D(D),
        .LED1_OBUF(LED1_OBUF),
        .btn_clean(btn_clean),
        .btn_prev(btn_prev),
        .btn_prev_reg(db_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(db_n_1),
        .Q(LED1_OBUF),
        .R(rst_active));
endmodule

(* ORIG_REF_NAME = "toggle_switch" *) 
module toggle_switch_3
   (LED2_OBUF,
    LED0_OBUF,
    rst_active,
    clk_IBUF_BUFG,
    D,
    LED4_OBUF,
    LED3_OBUF,
    SW_IBUF,
    LED1_OBUF);
  output LED2_OBUF;
  output LED0_OBUF;
  input rst_active;
  input clk_IBUF_BUFG;
  input [0:0]D;
  input LED4_OBUF;
  input LED3_OBUF;
  input [15:0]SW_IBUF;
  input LED1_OBUF;

  wire [0:0]D;
  wire LED0_OBUF;
  wire LED0_OBUF_inst_i_2_n_0;
  wire LED0_OBUF_inst_i_3_n_0;
  wire LED0_OBUF_inst_i_4_n_0;
  wire LED0_OBUF_inst_i_5_n_0;
  wire LED0_OBUF_inst_i_6_n_0;
  wire LED0_OBUF_inst_i_7_n_0;
  wire LED1_OBUF;
  wire LED2_OBUF;
  wire LED3_OBUF;
  wire LED4_OBUF;
  wire [15:0]SW_IBUF;
  wire btn_clean;
  wire btn_prev;
  wire clk_IBUF_BUFG;
  wire db_n_1;
  wire rst_active;

  MUXF8 LED0_OBUF_inst_i_1
       (.I0(LED0_OBUF_inst_i_2_n_0),
        .I1(LED0_OBUF_inst_i_3_n_0),
        .O(LED0_OBUF),
        .S(LED4_OBUF));
  MUXF7 LED0_OBUF_inst_i_2
       (.I0(LED0_OBUF_inst_i_4_n_0),
        .I1(LED0_OBUF_inst_i_5_n_0),
        .O(LED0_OBUF_inst_i_2_n_0),
        .S(LED3_OBUF));
  MUXF7 LED0_OBUF_inst_i_3
       (.I0(LED0_OBUF_inst_i_6_n_0),
        .I1(LED0_OBUF_inst_i_7_n_0),
        .O(LED0_OBUF_inst_i_3_n_0),
        .S(LED3_OBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    LED0_OBUF_inst_i_4
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[2]),
        .I2(LED2_OBUF),
        .I3(SW_IBUF[1]),
        .I4(LED1_OBUF),
        .I5(SW_IBUF[0]),
        .O(LED0_OBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    LED0_OBUF_inst_i_5
       (.I0(SW_IBUF[7]),
        .I1(SW_IBUF[6]),
        .I2(LED2_OBUF),
        .I3(SW_IBUF[5]),
        .I4(LED1_OBUF),
        .I5(SW_IBUF[4]),
        .O(LED0_OBUF_inst_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    LED0_OBUF_inst_i_6
       (.I0(SW_IBUF[11]),
        .I1(SW_IBUF[10]),
        .I2(LED2_OBUF),
        .I3(SW_IBUF[9]),
        .I4(LED1_OBUF),
        .I5(SW_IBUF[8]),
        .O(LED0_OBUF_inst_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    LED0_OBUF_inst_i_7
       (.I0(SW_IBUF[15]),
        .I1(SW_IBUF[14]),
        .I2(LED2_OBUF),
        .I3(SW_IBUF[13]),
        .I4(LED1_OBUF),
        .I5(SW_IBUF[12]),
        .O(LED0_OBUF_inst_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    btn_prev_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean),
        .Q(btn_prev),
        .R(rst_active));
  debounce_8 db
       (.D(D),
        .btn_clean(btn_clean),
        .btn_prev(btn_prev),
        .btn_prev_reg(db_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .state_reg(LED2_OBUF));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(db_n_1),
        .Q(LED2_OBUF),
        .R(rst_active));
endmodule

(* ORIG_REF_NAME = "toggle_switch" *) 
module toggle_switch_4
   (LED3_OBUF,
    rst_active,
    clk_IBUF_BUFG,
    D);
  output LED3_OBUF;
  input rst_active;
  input clk_IBUF_BUFG;
  input [0:0]D;

  wire [0:0]D;
  wire LED3_OBUF;
  wire btn_clean;
  wire btn_prev;
  wire clk_IBUF_BUFG;
  wire db_n_1;
  wire rst_active;

  FDRE #(
    .INIT(1'b0)) 
    btn_prev_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean),
        .Q(btn_prev),
        .R(rst_active));
  debounce_7 db
       (.D(D),
        .LED3_OBUF(LED3_OBUF),
        .btn_clean(btn_clean),
        .btn_prev(btn_prev),
        .btn_prev_reg(db_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(db_n_1),
        .Q(LED3_OBUF),
        .R(rst_active));
endmodule

(* ORIG_REF_NAME = "toggle_switch" *) 
module toggle_switch_5
   (rst_active,
    LED4_OBUF,
    clk_IBUF_BUFG,
    rst_IBUF,
    D);
  output rst_active;
  output LED4_OBUF;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input [0:0]D;

  wire [0:0]D;
  wire LED4_OBUF;
  wire btn_clean;
  wire btn_prev;
  wire clk_IBUF_BUFG;
  wire db_n_1;
  wire rst_IBUF;
  wire rst_active;

  LUT1 #(
    .INIT(2'h1)) 
    btn_prev_i_1
       (.I0(rst_IBUF),
        .O(rst_active));
  FDRE #(
    .INIT(1'b0)) 
    btn_prev_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_clean),
        .Q(btn_prev),
        .R(rst_active));
  debounce_6 db
       (.D(D),
        .LED4_OBUF(LED4_OBUF),
        .btn_clean(btn_clean),
        .btn_prev(btn_prev),
        .btn_prev_reg(db_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(db_n_1),
        .Q(LED4_OBUF),
        .R(rst_active));
endmodule

(* NotValidForBitStream *)
module top_mux_lab3
   (clk,
    rst,
    SW,
    btnU,
    btnD,
    btnL,
    btnR,
    LED0,
    LED1,
    LED2,
    LED3,
    LED4);
  input clk;
  input rst;
  input [15:0]SW;
  input btnU;
  input btnD;
  input btnL;
  input btnR;
  output LED0;
  output LED1;
  output LED2;
  output LED3;
  output LED4;

  wire LED0;
  wire LED0_OBUF;
  wire LED1;
  wire LED1_OBUF;
  wire LED2;
  wire LED2_OBUF;
  wire LED3;
  wire LED3_OBUF;
  wire LED4;
  wire LED4_OBUF;
  wire [15:0]SW;
  wire [15:0]SW_IBUF;
  wire btnD;
  wire btnD_IBUF;
  wire btnL;
  wire btnL_IBUF;
  wire btnR;
  wire btnR_IBUF;
  wire btnU;
  wire btnU_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [0:0]p_0_in;
  wire [0:0]p_0_in__0;
  wire [0:0]p_0_in__1;
  wire [0:0]p_0_in__2;
  wire rst;
  wire rst_IBUF;
  wire rst_active;

initial begin
 $sdf_annotate("tb_lab3_time_synth.sdf",,,,"tool_control");
end
  OBUF LED0_OBUF_inst
       (.I(LED0_OBUF),
        .O(LED0));
  OBUF LED1_OBUF_inst
       (.I(LED1_OBUF),
        .O(LED1));
  OBUF LED2_OBUF_inst
       (.I(LED2_OBUF),
        .O(LED2));
  OBUF LED3_OBUF_inst
       (.I(LED3_OBUF),
        .O(LED3));
  OBUF LED4_OBUF_inst
       (.I(LED4_OBUF),
        .O(LED4));
  IBUF \SW_IBUF[0]_inst 
       (.I(SW[0]),
        .O(SW_IBUF[0]));
  IBUF \SW_IBUF[10]_inst 
       (.I(SW[10]),
        .O(SW_IBUF[10]));
  IBUF \SW_IBUF[11]_inst 
       (.I(SW[11]),
        .O(SW_IBUF[11]));
  IBUF \SW_IBUF[12]_inst 
       (.I(SW[12]),
        .O(SW_IBUF[12]));
  IBUF \SW_IBUF[13]_inst 
       (.I(SW[13]),
        .O(SW_IBUF[13]));
  IBUF \SW_IBUF[14]_inst 
       (.I(SW[14]),
        .O(SW_IBUF[14]));
  IBUF \SW_IBUF[15]_inst 
       (.I(SW[15]),
        .O(SW_IBUF[15]));
  IBUF \SW_IBUF[1]_inst 
       (.I(SW[1]),
        .O(SW_IBUF[1]));
  IBUF \SW_IBUF[2]_inst 
       (.I(SW[2]),
        .O(SW_IBUF[2]));
  IBUF \SW_IBUF[3]_inst 
       (.I(SW[3]),
        .O(SW_IBUF[3]));
  IBUF \SW_IBUF[4]_inst 
       (.I(SW[4]),
        .O(SW_IBUF[4]));
  IBUF \SW_IBUF[5]_inst 
       (.I(SW[5]),
        .O(SW_IBUF[5]));
  IBUF \SW_IBUF[6]_inst 
       (.I(SW[6]),
        .O(SW_IBUF[6]));
  IBUF \SW_IBUF[7]_inst 
       (.I(SW[7]),
        .O(SW_IBUF[7]));
  IBUF \SW_IBUF[8]_inst 
       (.I(SW[8]),
        .O(SW_IBUF[8]));
  IBUF \SW_IBUF[9]_inst 
       (.I(SW[9]),
        .O(SW_IBUF[9]));
  IBUF btnD_IBUF_inst
       (.I(btnD),
        .O(btnD_IBUF));
  IBUF btnL_IBUF_inst
       (.I(btnL),
        .O(btnL_IBUF));
  IBUF btnR_IBUF_inst
       (.I(btnR),
        .O(btnR_IBUF));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  debounce dbD
       (.D(p_0_in),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\shift_reg_reg[0]_0 (btnD_IBUF));
  debounce_0 dbL
       (.D(p_0_in__1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\shift_reg_reg[0]_0 (btnL_IBUF));
  debounce_1 dbR
       (.D(p_0_in__0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\shift_reg_reg[0]_0 (btnR_IBUF));
  debounce_2 dbU
       (.D(p_0_in__2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\shift_reg_reg[0]_0 (btnU_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  toggle_switch t0
       (.D(p_0_in),
        .LED1_OBUF(LED1_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_active(rst_active));
  toggle_switch_3 t1
       (.D(p_0_in__0),
        .LED0_OBUF(LED0_OBUF),
        .LED1_OBUF(LED1_OBUF),
        .LED2_OBUF(LED2_OBUF),
        .LED3_OBUF(LED3_OBUF),
        .LED4_OBUF(LED4_OBUF),
        .SW_IBUF(SW_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_active(rst_active));
  toggle_switch_4 t2
       (.D(p_0_in__1),
        .LED3_OBUF(LED3_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_active(rst_active));
  toggle_switch_5 t3
       (.D(p_0_in__2),
        .LED4_OBUF(LED4_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF),
        .rst_active(rst_active));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
