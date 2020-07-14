// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Mar 15 23:39:30 2020
// Host        : DESKTOP-CKUVL5A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/SABER_FPGA/project_1/project_1.srcs/sources_1/ip/BRAM64_1024/BRAM64_1024_stub.v
// Design      : BRAM64_1024
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module BRAM64_1024(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[9:0],dina[63:0],clkb,addrb[9:0],doutb[63:0]" */;
  input clka;
  input [0:0]wea;
  input [9:0]addra;
  input [63:0]dina;
  input clkb;
  input [9:0]addrb;
  output [63:0]doutb;
endmodule
