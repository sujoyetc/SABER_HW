// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Apr 15 13:19:00 2020
// Host        : DESKTOP-CKUVL5A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/SABER_FPGA/Verilog_src/Polynomial_multiplier_prime/polmul_prime/polmul_prime.srcs/sources_1/ip/dsp_mul/dsp_mul_stub.v
// Design      : dsp_mul
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.1" *)
module dsp_mul(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[12:0],B[12:0],P[25:0]" */;
  input CLK;
  input [12:0]A;
  input [12:0]B;
  output [25:0]P;
endmodule
