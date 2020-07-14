-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Wed Apr 15 13:19:00 2020
-- Host        : DESKTOP-CKUVL5A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/SABER_FPGA/Verilog_src/Polynomial_multiplier_prime/polmul_prime/polmul_prime.srcs/sources_1/ip/dsp_mul/dsp_mul_stub.vhdl
-- Design      : dsp_mul
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dsp_mul is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    P : out STD_LOGIC_VECTOR ( 25 downto 0 )
  );

end dsp_mul;

architecture stub of dsp_mul is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[12:0],B[12:0],P[25:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xbip_dsp48_macro_v3_0_16,Vivado 2018.1";
begin
end;
