`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:37 07/13/2019 
// Design Name: 
// Module Name:    SHA_SHAKE_wrapper_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SHA_SHAKE_wrapper_test(clk, address_ext, dina_ext, wea_ext,
										command_in, command_we0, command_we1, 
										command_enable,
										done_shake);

input clk; 
input [8:0] address_ext;
input [63:0] dina_ext;
input wea_ext;

input [31:0] command_in;
input command_we0, command_we1, command_enable;
output done_shake;

reg [31:0] command_reg0, command_reg1;
wire [4:0] INS;
wire [8:0] OP1, OP2, OP3;

wire wea;
wire [8:0] addra, addrb;
wire [63:0] dina, doutb;

wire clear_sha, shake_intermediate_rst, shake_next_extract;
wire [1:0] rate_type;
wire [31:0] mlen, olen;
wire [8:0] rd_address_shake, wt_address_shake;
wire [63:0] din_shake, dout_shake;
wire sample_dout, done_shake;

always @(posedge clk)
begin
	if(command_we0)
		command_reg0 <= command_in;
	if(command_we1)
		command_reg1 <= command_in;
end


BRAM64 RAM(clk, wea, addra, dina, clk, addrb, doutb);

//assign INS = (command_enable) ? command_reg0[4:0] : 5'd31;
assign INS = command_reg0[4:0];
assign OP1 = command_reg0[13:5];
assign OP2 = command_reg0[22:14];
assign OP3 = command_reg0[31:23];	
						
assign mlen = {16'd0, command_reg1[15:0]};
assign olen = {16'd0, command_reg1[31:16]};

assign clear_sha = (INS==5'd0) ? 1'b1 : 1'b0;
assign enable_sha = (INS==5'd1||INS==5'd2||INS==5'd3||INS==5'd4||INS==5'd5) ? 1'b1 : 1'b0;
assign shake_intermediate_rst	= (INS==5'd4) ? 1'b1 : 1'b0;
assign shake_next_extract = (INS==5'd5) ? 1'b1 : 1'b0;
assign rate_type = (INS==5'd1) ? 2'd1 : (INS==5'd2) ? 2'd0 : 2'd2;
assign din_shake = doutb;

assign wea = (enable_sha) ? sample_dout : wea_ext;
assign dina = (enable_sha) ? dout_shake : dina_ext;
assign addra = (enable_sha) ? (wt_address_shake+OP3) : address_ext;
assign addrb = (enable_sha) ? (rd_address_shake+OP1) : address_ext;

SHA_SHAKE_wrapper SH(clk, clear_sha, shake_intermediate_rst, shake_next_extract, 
							rate_type, mlen, 
							rd_address_shake, din_shake,
							olen, dout_shake, wt_address_shake, sample_dout, 
							done_shake);


endmodule
