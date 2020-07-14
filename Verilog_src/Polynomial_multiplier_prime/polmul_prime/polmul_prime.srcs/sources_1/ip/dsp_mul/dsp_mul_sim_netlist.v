// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Apr 15 13:19:00 2020
// Host        : DESKTOP-CKUVL5A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/SABER_FPGA/Verilog_src/Polynomial_multiplier_prime/polmul_prime/polmul_prime.srcs/sources_1/ip/dsp_mul/dsp_mul_sim_netlist.v
// Design      : dsp_mul
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_mul,xbip_dsp48_macro_v3_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module dsp_mul
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [25:0]P;

  wire [12:0]A;
  wire [12:0]B;
  wire CLK;
  wire [25:0]P;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "13" *) 
  (* C_B_WIDTH = "13" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "25" *) 
  (* C_REG_CONFIG = "00000000000011000011000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dsp_mul_xbip_dsp48_macro_v3_0_16 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "13" *) (* C_B_WIDTH = "13" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "0" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000100100000010100000000" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "25" *) (* C_REG_CONFIG = "00000000000011000011000001000100" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynquplus" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_16" *) (* downgradeipidentifiedwarnings = "yes" *) 
module dsp_mul_xbip_dsp48_macro_v3_0_16
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [12:0]A;
  input [12:0]B;
  input [47:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [25:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [12:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [12:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CARRYOUT;
  wire CLK;
  wire [25:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;

  (* C_A_WIDTH = "13" *) 
  (* C_B_WIDTH = "13" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "25" *) 
  (* C_REG_CONFIG = "00000000000011000011000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dsp_mul_xbip_dsp48_macro_v3_0_16_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
eXLekaf75ti+4/KsymzULXz5oAVLFk8Gyt04ecmjgdcncfRtXhJiOnHdtUin/mnzHVOHKb2xw8pI
uJb6sYCeGQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BkNI+/boD/MiJaVq4b9JNlguFR/nrO0yPwyATYiWCbZhEACCZlbA0BozqIHRVLhpn+svUysa1kP/
eIbVP3hSYf9Gx4xfMK8vw4T5doS3Wh0r3tnlSQ/wOV20uFrfqlPtuabFlcgrNFEg3w6ngaiLyRCC
zlREFWcxjmjqKL4B0Mw=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pGK9qQvehhEvErzSMUPB04UVVkE94epOG0uZA/7tMT2kqsaLV2YRqmW0xo347n3SYA/eNF30kvGd
2v169ZPU9U+ghcefgrOTIG/0WoeiDiBJvglmiQ3UaeofxOLXxJCA11dxWxuRKGIcvnUxKv7l5qor
coo0gmnDXFgfng3sFu1XB8DIEjph5whwXganiWwh35tW2vljw5e5VWr0NUkDCFPHQqwTPfuLLSTY
EVIlNRX3X+0qkCLb6F6LKvdU/xsDkXtNI3jV99atQ1BHNsSRJgAS+9dQs2hwZ9WnyH3OYSbiwj8n
CT9IYsL+mHlE5tUacsw1s8UoMn4DGNZxCobIJg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rgDaV4/mhsnos5RFqNRIj4sj11Jf1a3m8YjiIU5cK9EtlwMdJCgssm0aIN5i8CxsXn72kepYcg8X
j5DhRFEKbsK+wjVxTbrFNMpgwHXQAjvmsZnn+HuC6ZP5+eK0aTmGEDzQN1+IyHAqrMBIi1y2CJZP
utmopTNrD1IorfWY0HkHbZPK/FYW03e0IDrwmDxdTxygPK1ef14uRc5XgbMDH6aHsz4lizY3mnqF
7zQj55G/mQV0zODFs7O4Lz1kvXI7zSy/y2bN71nIDsrmSkDiJ55CxhURxc7qfThhlir0NAd5l2ya
iGyxe6L5fo/NBXnefVFkWcHHcZXJuCfsY/gKvg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bbm+Bhk0wBaFjFA9Ea11gJ7vMup06mFvo96KGxhbqN3zPDugDFuQv08KjoMp8V+rQC8s/o38FQhx
8Mw+TbWN3glC/HEfcfr+0ozgp5344o93hsiR3+MMKXhx5tu5oQVo4BpmPH6rmVlEtPVdDlgol7F8
9hjg9IhJBwRbYgKuy/Ms/k2ex23of35a1Ovpjj41z9RSp/Bon6ZNxfWeqgKq7RivVGU77w8zR0ti
PBCvjBBF2+vPvWj6g57/RuceCw+BwG8dIMbmwtCz0Y8JVD0uYVKgvcMVUr/Lg5uDUHPlFSRNbJgv
duAbv5dxQq0b5LfuR/YMNz8EZGgBfq7DnSqinw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
rN6p2yPlgLWyn9/t3wZUjPzr6Y6bUzmHiPwkg+XDW5hEhsHw5w3Lp51pJNUJVDiqw+t/HwWW3lY9
4goQArkKjN/4p++LpVanpS7CNtHdOHBd7a5WXKqTlNBbmKLF8yq889d8PC7MCadre0FVBNA7dfoB
KOJoWnAbUFUbCir8o6M=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Br53BAhOJATkKjg2iPNqGoGKK4u590bUn26AaoQALXJEfUkCMI57obgv/a9IRyf+IuzYeDIYp38W
+Fq9elQqoe7uj+NQp4lmRHPS57EZreTi/rxOAq+OXOJn7dvBRTPhH+UEYbyxdTpZibHYVECka85P
hAPc+XzXsDPnoNa6HXuUchScM60H3bfzxvgYesGd7SPtHCikV/d8Y9jQ794xqBwRWKoNOhMZUB8D
h674MCTcGJO2unqZsQya6GGK98IPAEscAOhuNr1X+gkTYrp3jJi82QCDvuJFhMt0NWAskmtuFIvs
ymumLguDevG/3o+HKdfbAOSBU3zUrqwVITxO/Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WG3sFs+LR5hAoau6ya562C2ddAUBGl3+6+xgBEOE3MWFZcco3LRXmzXq2ARf5HpllsIFvEETf4NQ
Wo31b6LxHBC3aNJnQ4I7o2oAM8C0hkph6JNHlB9Mt38KKMP5SFLwpdx+hVHpGHP0JZfLG0bguQz/
P7dxOhMLiA5Uw5WVzbY9R5scCT61YRCkfsU+QUhKDP8B5YFDJbTb5WfWZsdVyDWbIDFvH1qM+C1g
84/OzAhSIoK2RTzdWTT+pfqsldrnMndTzejllc4leFsf5HjNzKxivsV5/Tr8AfVXaxSGnG4XiZqO
qg3Unyp8FL04XFmEaTS1TmSc65akeG78Q724xg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SHuYkffUnmKx+3MQHWVSGmBd3rXUbciXc9DeZyCFa0sMFHGTkSKuYVO9ybECwlCCXgRJaai27+Er
slfq+x7WBVBY4va2bgGvpkGC7M8KrvF8azP5kLpFB2E9CRsN44C1UGlz7hlGeTLkKKb1FLJz8w3q
Q6ftcc1ghGD2sb/sCn00+9wy7c/26ItlUxU/PgpVCGf7/cRJdfAyGBlqGuSGrG/WDx4J5XDTm1jC
HiJGoLE7Oik2Z70aAxsCb8NamPMX8wg7yspHEZ7QD9e/vEPUucORyBER9JBzH1QcYomERvBDACy6
6aoFmiQcPSzScSsw3+tygbnE8GjcQh3W7gYBdg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31072)
`pragma protect data_block
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
B2/qZ8QIKQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
