`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// High-speed instruction set coprocessor architecture for lattice-based cryptography. 
// Saber is implemented as a case study.
// The designers are Sujoy Sinha Roy and Andrea Basso. 

// Implementation by the designers, hereby denoted as "the implementer".

// To the extent possible under law, the implementer has waived all copyright
// and related or neighboring rights to the source code in this file.
// http://creativecommons.org/publicdomain/zero/1.0/

// The codes are for academic research use only and does not come with any support or any responsibility.

//////////////////////////////////////////////////////////////////////////////////

module ComputeCoreWrapper(clk, control_low_word, control_high_word, 
                    dina_ext_low_word, dina_ext_high_word, 
                    dout_ext_low_word, dout_ext_high_word, 
                    status);
input clk;
input [31:0] control_low_word, control_high_word;
input [31:0] dina_ext_low_word, dina_ext_high_word;

output [31:0] dout_ext_low_word, dout_ext_high_word;
output [31:0] status;

//wire [63:0] control = {control_high_word,control_low_word};
wire [63:0] dina_ext = {dina_ext_high_word,dina_ext_low_word};
wire [63:0] dout_ext;
reg [31:0] status;
wire rst_core;

wire [9:0] address_ext;
wire wea_ext, wea_ext_core, wea_ext_ISA;

wire [34:0] command_in;
wire command_we0, command_we1;
wire done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler, done_verify, done_cmov, done_timer;

wire rst_ISA, start_ISA, done_ins_computation, done_all_computation;
wire [31:0] status_wire;
wire [30:0] cycle_count;

assign address_ext = control_low_word[9:0];
assign wea_ext = control_low_word[10];
//assign command_in = control[45:11];
//assign command_we0 = control[46];
//assign command_we1 = control[47];

//assign status_wire = {23'd0, done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler,done_all_computation};
assign status_wire = {cycle_count,done_all_computation};
assign {dout_ext_high_word,dout_ext_low_word} = dout_ext;
assign wea_ext_core = (wea_ext==1'b1 & control_low_word[11]==1'b0) ? 1'b1 : 1'b0;

always @(posedge clk)
    status <= status_wire;
    
ComputeCore3 CORE(clk, rst_core, address_ext, dina_ext, wea_ext_core,
					command_in, command_we0, command_we1,
					dout_ext, 
					done_shake, done_vmul, done_addround, 
					done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler, done_verify, done_cmov, done_timer);

assign done_ins_computation = done_shake|done_vmul|done_addround|done_addpack|done_bs2polvecp|done_unpack|done_copy|done_sampler|done_verify|done_cmov|done_timer;

assign rst_core = control_high_word[0];
assign rst_ISA = control_high_word[0];
assign start_ISA = control_high_word[1];
assign wea_ext_ISA = (wea_ext==1'b1 & control_low_word[11]==1'b1) ? 1'b1 : 1'b0;

ISA_control ISA_CTRL(clk, rst_ISA, start_ISA, done_ins_computation,
                                    address_ext[5:0], dina_ext[36:0], wea_ext_ISA,
									command_in,	command_we0, command_we1,
									done_all_computation,
									cycle_count);

endmodule
