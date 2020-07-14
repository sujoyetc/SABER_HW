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

module ComputeCore3(clk, rst, address_ext, dina_ext, wea_ext,
					command_in, command_we0, command_we1, 
					doutb_ext,
					done_shake, done_vmul, done_addround, 
					done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler, done_verify, done_cmov, done_timer);

input clk, rst; 
input [9:0] address_ext;
input [63:0] dina_ext;
input wea_ext;

input [34:0] command_in;
input command_we0, command_we1;
output [63:0] doutb_ext;
output done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler, done_verify, done_cmov, done_timer;



reg [34:0] command_reg0, command_reg1;
wire [4:0] INS;
wire [9:0] OP1, OP2, OP3;

always @(posedge clk)
begin
    if(rst)
        command_reg0 <= 35'd0;
	else if(command_we0)
		command_reg0 <= command_in;
	else
	   command_reg0 <= command_reg0;	
end
always @(posedge clk)
begin
    if(rst)
        command_reg1 <= 35'd0;
	else if(command_we1)
		command_reg1 <= command_in;
	else
	   command_reg1 <= command_reg1;	
end


assign INS = command_reg0[4:0];
assign OP1 = command_reg0[14:5];
assign OP2 = command_reg0[24:15];
assign OP3 = command_reg0[34:25];	
//// done till here ////


wire clear_sha, enable_sha, shake_intermediate_rst, shake_next_extract;
wire [1:0] rate_type;
wire [31:0] mlen, olen;
wire [8:0] rd_address_shake, wt_address_shake;
wire [63:0] din_shake, dout_shake;
wire sample_dout, done_shake;

wire rst_sampler, wea_sampler, done_sampler;
wire [8:0] rd_address_sampler, wt_address_sampler;
wire [63:0] dout_sampler;

wire rst_vmul, pol_load_coeff4x, s_load_happens_now, wea_vmul, done_vmul;
wire [8:0] rd_address_vmul, s_address, wt_address_vmul;
wire [2:0] s;
wire s_sign;
wire [63:0] dout_vmul;

wire rst_addround, wea_addround, done_addround;
wire [8:0] rd_address_addround, wt_address_addround;
wire [63:0] dout_addround;

wire rst_addpack, wea_addpack, done_addpack;
wire rd_base_sel_addpack;
wire [8:0] rd_address_addpack, wt_address_addpack;
wire [63:0] dout_addpack;

wire rst_unpack, wea_unpack, done_unpack;
wire rd_base_sel_unpack;
wire [8:0] rd_address_unpack, wt_address_unpack;
wire [63:0] dout_unpack;

wire rst_bs2polvecp, wea_bs2polvecp, done_bs2polvecp;
wire [8:0] rd_address_bs2polvecp, wt_address_bs2polvecp;
wire [63:0] dout_bs2polvecp;

wire rst_copy, wea_copy, done_copy; 
wire [8:0] number_words_copy, rd_address_copy, wt_address_copy;
wire [63:0] dout_copy;
 
                            
wire [9:0] rd_address, wt_address;
wire [9:0] addra, addrb;
wire wea;
wire [63:0] dina, doutb;

wire [9:0] ilen;
wire rst_verify, rd_base_sel_verify, verify_true_wire, done_verify;
wire [8:0] rd_address_verify;
reg verify_true;

wire rst_cmov, rd_base_sel_cmov, wea_cmov, done_cmov;
wire [8:0] rd_address_cmov, wt_address_cmov;
wire [63:0] dout_cmov;

wire rst_timer;
wire [8:0] rd_address_timer;
wire done_timer;

assign rst_vmul = (INS==5'd6||INS==5'd10) ? 1'b0 : 1'b1;
assign pol_load_coeff4x = (INS==5'd10) ? 1'b1 : 1'b0;   ////// CHECK to update
assign rst_addround = (INS==5'd7) ? 1'b0 : 1'b1;
assign rst_addpack = (INS==5'd8) ? 1'b0 : 1'b1;
assign rst_bs2polvecp = (INS==5'd9) ? 1'b0 : 1'b1;
assign rst_unpack = (INS==5'd11) ? 1'b0 : 1'b1;
assign rst_copy = (INS==5'd12) ? 1'b0 : 1'b1;
assign rst_sampler = (INS==5'd13) ? 1'b0 : 1'b1;
assign rst_verify = (INS==5'd14) ? 1'b0 : 1'b1;
assign rst_cmov = (INS==5'd15) ? 1'b0 : 1'b1;
assign rst_timer = (INS==5'd17) ? 1'b0 : 1'b1;
 
//assign rd_address = (enable_sha) ? {1'b0,rd_address_shake} : (rst_vmul==1'b0) ? {1'b0,rd_address_vmul} : (rst_addround==1'b0) ? {1'b0,rd_address_addround} : (rst_addpack==1'b0) ? {1'b0,rd_address_addpack} : (rst_bs2polvecp==1'b0) ? {1'b0,rd_address_bs2polvecp} : (rst_unpack==1'b0) ? {1'b0,rd_address_unpack} : (rst_copy==1'b0) ? {1'b0,rd_address_copy} : (rst_sampler==1'b0) ? {1'b0,rd_address_sampler} : (rst_verify==1'b0) ? {1'b0,rd_address_verify} : (rst_cmov==1'b0) ? {1'b0,rd_address_cmov} : (rst_timer==1'b0) ? {1'b0,rd_address_timer} : address_ext;
assign rd_address = (enable_sha) ? {1'b0,rd_address_shake} : (rst_vmul==1'b0) ? {1'b0,rd_address_vmul} : (rst_addround==1'b0) ? {1'b0,rd_address_addround} : (rst_addpack==1'b0) ? {1'b0,rd_address_addpack} : (rst_bs2polvecp==1'b0) ? {1'b0,rd_address_bs2polvecp} : (rst_unpack==1'b0) ? {1'b0,rd_address_unpack} : (rst_copy==1'b0) ? {1'b0,rd_address_copy} : (rst_sampler==1'b0) ? {1'b0,rd_address_sampler} : (rst_verify==1'b0) ? {1'b0,rd_address_verify} : (rst_cmov==1'b0) ? {1'b0,rd_address_cmov} : address_ext;
assign wt_address = (enable_sha) ? {1'b0,wt_address_shake} : (rst_vmul==1'b0) ? {1'b0,wt_address_vmul} : (rst_addround==1'b0) ? {1'b0,wt_address_addround} : (rst_addpack==1'b0) ? {1'b0,wt_address_addpack} : (rst_bs2polvecp==1'b0) ? {1'b0,wt_address_bs2polvecp} : (rst_unpack==1'b0) ? {1'b0,wt_address_unpack} : (rst_copy==1'b0) ? {1'b0,wt_address_copy} : (rst_sampler==1'b0) ? {1'b0,wt_address_sampler} : (rst_cmov==1'b0) ? {1'b0,wt_address_cmov} : address_ext;
assign wea = (enable_sha) ? sample_dout : (rst_vmul==1'b0) ? wea_vmul : (rst_addround==1'b0) ? wea_addround : (rst_addpack==1'b0) ? wea_addpack : (rst_bs2polvecp==1'b0) ? wea_bs2polvecp : (rst_unpack==1'b0) ? wea_unpack : (rst_copy==1'b0) ? wea_copy : (rst_sampler==1'b0) ? wea_sampler : (rst_cmov==1'b0) ? wea_cmov : wea_ext;
assign dina = (enable_sha) ? dout_shake : (rst_vmul==1'b0) ? dout_vmul : (rst_addround==1'b0) ? dout_addround : (rst_addpack==1'b0) ? dout_addpack : (rst_bs2polvecp==1'b0) ? dout_bs2polvecp : (rst_unpack==1'b0) ? dout_unpack : (rst_copy==1'b0) ? dout_copy : (rst_sampler==1'b0) ? dout_sampler :  (rst_cmov==1'b0) ? dout_cmov : dina_ext;
wire op2_sel = (rst_addpack==1'b0) ? rd_base_sel_addpack : (rst_unpack==1'b0) ? rd_base_sel_unpack : (rst_vmul==1'b0) ? s_load_happens_now : (rst_verify==1'b0) ? rd_base_sel_verify : (rst_cmov==1'b0) ? rd_base_sel_cmov : 1'b0;

wire [9:0] OP1_or_OP2 = (op2_sel) ? OP2 : OP1;
assign addra = OP3 + wt_address;
assign addrb = OP1_or_OP2 + rd_address;

assign doutb_ext = doutb;

wire [63:0] s_vec_64;

/*
VectorMul_wrapper	VMUL0(clk, rst_vmul, pol_load_coeff4x,
								rd_address_vmul, doutb,
								s_address, s, s_sign,	// s_address will be merged later
								wt_address_vmul, dout_vmul, wea_vmul, 
								done_vmul);
*/								
SHA_SHAKE_wrapper SH(clk, clear_sha, shake_intermediate_rst, shake_next_extract, 
							rate_type, mlen, 
							rd_address_shake, din_shake,
							olen, dout_shake, wt_address_shake, sample_dout, 
							done_shake);

assign enable_sha = (INS==5'd1||INS==5'd2||INS==5'd3||INS==5'd4||INS==5'd5) ? 1'b1 : 1'b0;
assign clear_sha = (INS==5'd0 || enable_sha==1'b0) ? 1'b1 : 1'b0;
assign shake_intermediate_rst	= (INS==5'd4) ? 1'b1 : 1'b0;
assign shake_next_extract = (INS==5'd5) ? 1'b1 : 1'b0;
assign rate_type = (INS==5'd1) ? 2'd1 : (INS==5'd2) ? 2'd0 : 2'd2;
assign mlen = {16'd0, command_reg1[15:0]};
assign din_shake = doutb;
assign olen = {16'd0, command_reg1[31:16]};

VectorMul_wrapper	VMUL0(clk, rst_vmul, pol_load_coeff4x,
								s_load_happens_now, rd_address_vmul, doutb,
								//s_address, s_vec_64,	// s_address will be merged later
								wt_address_vmul, dout_vmul, wea_vmul, 
								done_vmul);
								
Add_Round	AddRound0(clk, rst_addround, rd_address_addround, doutb,
									wt_address_addround, dout_addround, wea_addround,
									done_addround);
									
Add_m_pack	AddPack0(clk, rst_addpack, rd_base_sel_addpack, rd_address_addpack, doutb,
									wt_address_addpack, dout_addpack, wea_addpack,
									done_addpack);

BS2POLVECp	BC2PVEC(clk, rst_bs2polvecp, rd_address_bs2polvecp, doutb,
								 wt_address_bs2polvecp, dout_bs2polvecp, wea_bs2polvecp,
								 done_bs2polvecp);

unpack		unpack0(clk, rst_unpack, rd_base_sel_unpack, rd_address_unpack, doutb,
									wt_address_unpack, dout_unpack, wea_unpack,
									done_unpack);

// Copy from OP1 to OP3 where the number of words is specified in OP2								
copy_words        copy(clk, rst_copy, number_words_copy, 
                            rd_address_copy, doutb,
                            wt_address_copy, dout_copy, wea_copy,
                            done_copy);
assign number_words_copy = OP2[8:0];                          

									
vector_sampler      Sampler(clk, rst_sampler, rd_address_sampler, doutb,
						      dout_sampler, wt_address_sampler, wea_sampler, done_sampler);

assign ilen = command_reg1[9:0];
						
verify              VERIFY1(clk, rst_verify, ilen, rd_address_verify, rd_base_sel_verify, doutb,
                           verify_true_wire, done_verify);

cmov                CMOV1(clk, rst_cmov, verify_true,
						rd_base_sel_cmov, rd_address_cmov, doutb,
						wt_address_cmov, dout_cmov, wea_cmov,
						done_cmov);

/*
timer_loop         timer_loop(clk, rst_timer,  
						  rd_address_timer, doutb,
						  done_timer);
*/
assign done_timer = 1'b0;

always @(posedge clk)
begin
    if(done_verify)
        verify_true <= verify_true_wire;
    else
        verify_true <= verify_true;
 end
            									
BRAM64_1024 BR (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [9 : 0] addra
  .dina(dina), // input [63 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrb), // input [9 : 0] addrb
  .doutb(doutb) // output [63 : 0] doutb
);


endmodule
