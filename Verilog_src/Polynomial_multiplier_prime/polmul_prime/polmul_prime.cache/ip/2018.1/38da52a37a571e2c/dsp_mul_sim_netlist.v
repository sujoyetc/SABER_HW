// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Apr 15 13:18:55 2020
// Host        : DESKTOP-CKUVL5A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_mul_sim_netlist.v
// Design      : dsp_mul
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_mul,xbip_dsp48_macro_v3_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16 U0
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
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16_viv i_synth
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
CEI9VY/84cz1CdUE379QSfrx23wPbSFO1Rm8fTIgVFn71w5aJZMd2RoG+xOkytKTTwI2q+o/TqxJ
JqnxvmhJOy/H8vXWUX2jq+P/qI8cDdfiz7SbLILGNWipbRwihWvuS4bicOYWQMU07nxoQpdyTLcG
jaJdUCnZfUjXv/QGYxJt4nfm0jOt0ZhfNIUMrDHaUcdBAN0aO4SkiOEJVrDVDxtrKMl5QjGRJWmF
qu3YWFzmTzP57dBw/UjQOgW50bvo4eLLLTL56R8v53OxYAcuSXvnbYaTHNne+JX3UoF6JLAE83ow
8tCNmkQVgVPM2iVVqT8b0/48QplQuOLYlQbtUA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BMWry7eHN7h8Io2ibtJPDiUh8spyyoTd+kl2OVxWcK9ZW7//9Wkp/W51vdFZuC6llbatz8MoO7y5
JQ8VpzQcH2/MqMryiBS9Tjih12tgzhjI0FPzDJ6XX8mI+YcYp0p1PlnkjAINedLowbZWKw10wQXn
JbgQ4RP8RjCNwf1pqEIALUhyF2nM2bkIW1uLNvbZAkJDd8K9TBBnQx3jnqA2675jjo5g5CDVmB8b
2JCLHjh3cKBAOiHLceRfovd7EgZLQQ7NDf+K3OzjRjuE2jRkqUhKHR9vgjqWkBUZfwn6uEzgKHSU
Km2PoqU0eaAP6qr6KmZ3W4cQ+fjIWx4L4OIcCw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31424)
`pragma protect data_block
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
Ts9XykY5Ftq/+3FrEukY3iw=
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
