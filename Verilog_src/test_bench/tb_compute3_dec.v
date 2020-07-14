`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:48 07/21/2019
// Design Name:   ComputeCore3
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/saber_mult_RAM/tb_compute3_dec.v
// Project Name:  saber_mult
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ComputeCore3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_compute3_dec;

	// Inputs
	reg clk;
	reg [8:0] address_ext;
	reg [63:0] dina_ext;
	reg wea_ext;
	reg [34:0] command_in;
	reg command_we0;
	reg command_we1;

	// Outputs
	wire done_shake;
	wire done_vmul;
	wire done_addround;
	wire done_addpack;
	wire done_bs2polvecp;
	wire done_unpack;
	
	reg [63:0] ct[119:0], v[63:0], scale_ar[15:0];
	reg [15:0] i;
	
	// Instantiate the Unit Under Test (UUT)
	ComputeCore3 uut (
		.clk(clk), 
		.address_ext(address_ext), 
		.dina_ext(dina_ext), 
		.wea_ext(wea_ext), 
		.command_in(command_in), 
		.command_we0(command_we0), 
		.command_we1(command_we1), 
		.done_shake(done_shake), 
		.done_vmul(done_vmul), 
		.done_addround(done_addround), 
		.done_addpack(done_addpack), 
		.done_bs2polvecp(done_bs2polvecp),
		.done_unpack(done_unpack)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		address_ext = 0;
		dina_ext = 0;
		wea_ext = 0;
		command_in = 0;
		command_we0 = 0;
		command_we1 = 0;
		i = 0;
		ct[0] = 64'hb00084be7d17c3d;
		ct[1] = 64'h1dd8f69113c1a1bb;
		ct[2] = 64'h8d13edd209759855;
		ct[3] = 64'h28b7c7d996a5b7e1;
		ct[4] = 64'h1ef606e5505b9464;
		ct[5] = 64'h74325d08968dd162;
		ct[6] = 64'h7b3a0055a6160042;
		ct[7] = 64'h6f6afdfff3803594;
		ct[8] = 64'h262da9214541cd48;
		ct[9] = 64'hf6ab896e722a3976;
		ct[10] = 64'hc297dffd3d9a92d3;
		ct[11] = 64'hd9e414bbb38bd8bc;
		ct[12] = 64'h2571d765d1c7aaec;
		ct[13] = 64'hd9415f0f420c9f11;
		ct[14] = 64'ha80ec53f0c5bc30b;
		ct[15] = 64'h2a20a9a2b98efe36;
		ct[16] = 64'hce92350c5247babd;
		ct[17] = 64'hc86c3038659bf869;
		ct[18] = 64'hce08d9340141a7cc;
		ct[19] = 64'hfce93b5067ef48e6;
		ct[20] = 64'h961a442d1e49c86e;
		ct[21] = 64'h8f750ad250acbf87;
		ct[22] = 64'h4665423db9942fe8;
		ct[23] = 64'h2bf54b82dd0fb22a;
		ct[24] = 64'h32773d478df1d057;
		ct[25] = 64'h45f0a07baa2dce3b;
		ct[26] = 64'hb65ea985f4c883c;
		ct[27] = 64'h52db08426d070e60;
		ct[28] = 64'hcde52814ec08963d;
		ct[29] = 64'h6274900d93b82b47;
		ct[30] = 64'hfee4f0ba66ecc3b9;
		ct[31] = 64'hc5861d4401acd205;
		ct[32] = 64'h1155e3d2b3ecfd3c;
		ct[33] = 64'hd8ba1662970b5955;
		ct[34] = 64'he040ad890b8ff154;
		ct[35] = 64'hf21f59202251e5db;
		ct[36] = 64'h80fd8842bb2fed61;
		ct[37] = 64'h6161477a8d346d45;
		ct[38] = 64'h8d65571e7ab4dd24;
		ct[39] = 64'h5f358c00581b1067;
		ct[40] = 64'hbfa7ac1a682cab27;
		ct[41] = 64'h3ce16a77c29e58f0;
		ct[42] = 64'hb5a27a96923c48b2;
		ct[43] = 64'h7d828f744f9a1f12;
		ct[44] = 64'h96c19abccd4f34d7;
		ct[45] = 64'h1b0dac64f2d9ea0;
		ct[46] = 64'h4a20d6f847d91a96;
		ct[47] = 64'h5af072c03d2901a4;
		ct[48] = 64'h950f145621fbca48;
		ct[49] = 64'h6ca90afbcd1324fd;
		ct[50] = 64'ha90df05542f571bd;
		ct[51] = 64'he88d495063ee891d;
		ct[52] = 64'hbfa8287e36e0b726;
		ct[53] = 64'he5cb35fc3a59a182;
		ct[54] = 64'h1ed77bc9138d772b;
		ct[55] = 64'hca3ac69f524561cd;
		ct[56] = 64'h4e2ced8dcb42ff18;
		ct[57] = 64'he489fbc237ae293b;
		ct[58] = 64'hdb76578a32ef1932;
		ct[59] = 64'hd19f757f3dc9e401;
		ct[60] = 64'heeb833b8076091;
		ct[61] = 64'ha54ea69c4303e39b;
		ct[62] = 64'h535ea2b096c9916e;
		ct[63] = 64'h1d847b3fd24ec7c4;
		ct[64] = 64'hf5069678c1a50b21;
		ct[65] = 64'h86a9bc200ab7fe29;
		ct[66] = 64'h48660a2490f4246d;
		ct[67] = 64'h614310c8655d0d0;
		ct[68] = 64'h7568f6815ece20c;
		ct[69] = 64'hba86b90a5efc351e;
		ct[70] = 64'h2b80159e66ca2c3a;
		ct[71] = 64'h52372d312a05c597;
		ct[72] = 64'hdda44ee3371b1692;
		ct[73] = 64'he88e1ff454ba114e;
		ct[74] = 64'h33040187a267c3d0;
		ct[75] = 64'hdb4e4d3d2fbf1b54;
		ct[76] = 64'h42e2ed42a920b808;
		ct[77] = 64'h635238025f790aea;
		ct[78] = 64'h33b51433e5db2432;
		ct[79] = 64'hdd66714064176686;
		ct[80] = 64'h9da03b8ed167345f;
		ct[81] = 64'h6fde06eae50bf300;
		ct[82] = 64'h9a41c7d2e29de0c6;
		ct[83] = 64'h7e6a9e256df1432d;
		ct[84] = 64'h69ac7c2d24692fda;
		ct[85] = 64'h4d80e9867740e5e4;
		ct[86] = 64'h59ab1c1090bfb262;
		ct[87] = 64'h4f9419bc01f06429;
		ct[88] = 64'hf32bd2227ef6bc18;
		ct[89] = 64'h2ad3d558c038f94b;
		ct[90] = 64'h63e758ff88569d0c;
		ct[91] = 64'heee1084b4243dd2a;
		ct[92] = 64'h58f36d4a515da83b;
		ct[93] = 64'h88e32bde6897bba2;
		ct[94] = 64'h73acd64ecd218c07;
		ct[95] = 64'h426cde49133e027f;
		ct[96] = 64'h615ad90dbfe26e29;
		ct[97] = 64'h84065ceda70affb;
		ct[98] = 64'h8c7675d0ba2d8627;
		ct[99] = 64'h9163f63ea532456b;
		ct[100] = 64'h8f1e319cf567470a;
		ct[101] = 64'hf2ef11b244f70076;
		ct[102] = 64'h3f5297e5e3bb9195;
		ct[103] = 64'he560b4421b4c032;
		ct[104] = 64'h9da1ecbe9c05639d;
		ct[105] = 64'h219614c735e7baa9;
		ct[106] = 64'haf511d073b8552f4;
		ct[107] = 64'h65ed644cdf0f5ea5;
		ct[108] = 64'hc8f5b8c2a42f77cb;
		ct[109] = 64'h54572457de998647;
		ct[110] = 64'h375cfb38e74d0c64;
		ct[111] = 64'ha2459100336375c6;
		ct[112] = 64'hda76aa2455fb356e;
		ct[113] = 64'h2302dcaa006c9342;
		ct[114] = 64'h1544caa0e2660bed;
		ct[115] = 64'h8540f434ce149a2f;
		ct[116] = 64'h9ceb65124a72a48f;
		ct[117] = 64'he74449d13fb34967;
		ct[118] = 64'hf5d20af34527286;
		ct[119] = 64'h1a35c41ac9986ed6;

		v[0] = 64'h1a001e30105021a;
		v[1] = 64'h12401b800d602e1;
		v[2] = 64'h34d01c9037901aa;
		v[3] = 64'h19e006201e202cf;
		v[4] = 64'h1d302d401c0029c;
		v[5] = 64'h11f0181025502c1;
		v[6] = 64'h22f0328017a0279;
		v[7] = 64'h2db02fa002602cc;
		v[8] = 64'h2400156007b03dc;
		v[9] = 64'h27c00a50087029d;
		v[10] = 64'h30d039b03910087;
		v[11] = 64'h2ef007a020001a2;
		v[12] = 64'h28034600a1017b;
		v[13] = 64'h8c0008016c019a;
		v[14] = 64'h2d301c6001d03b9;
		v[15] = 64'hd02060394003e;
		v[16] = 64'h22d0086017800c4;
		v[17] = 64'h2c603670284023c;
		v[18] = 64'hb0017e033401d4;
		v[19] = 64'h2e80089012b02f9;
		v[20] = 64'h13102d702d402f8;
		v[21] = 64'h29e008700fa0053;
		v[22] = 64'h38a021b032503e0;
		v[23] = 64'h3e000ea03850374;
		v[24] = 64'h2f9011901dd03c2;
		v[25] = 64'h4a01fa0337003b;
		v[26] = 64'h1d20041001e03ea;
		v[27] = 64'h9d01c9033f0397;
		v[28] = 64'h171033a00e7027d;
		v[29] = 64'he903e601350078;
		v[30] = 64'h305015a03c50036;
		v[31] = 64'h2b6025b038402ad;
		v[32] = 64'h3f00322010d01cc;
		v[33] = 64'h15e00c601af0041;
		v[34] = 64'h6800ff014d0040;
		v[35] = 64'h20e01df00f90149;
		v[36] = 64'h2c800c4001d0311;
		v[37] = 64'h17d029602a70006;
		v[38] = 64'h1be01c802f400a9;
		v[39] = 64'h36e00d400eb032a;
		v[40] = 64'h2c800d20368038a;
		v[41] = 64'h117010600e103fc;
		v[42] = 64'h1a003a0010a0116;
		v[43] = 64'hf301a501a7011b;
		v[44] = 64'h7100e602240389;
		v[45] = 64'h3bd03df00e80272;
		v[46] = 64'h1e01ae0252034e;
		v[47] = 64'h36100b501b503f4;
		v[48] = 64'h31c021400b903bc;
		v[49] = 64'h14801b103aa0253;
		v[50] = 64'h22700d301bb02aa;
		v[51] = 64'h36702820178025e;
		v[52] = 64'hd90291027e0215;
		v[53] = 64'h1b800030256014d;
		v[54] = 64'h143033a01b301d6;
		v[55] = 64'h13600ce015303ea;
		v[56] = 64'h3c2024401090271;
		v[57] = 64'h2f033201910322;
		v[58] = 64'h319003400900014;
		v[59] = 64'h28011603f402b1;
		v[60] = 64'h272022f01000083;
		v[61] = 64'h23202b2025401a9;
		v[62] = 64'h20003600f70241;
		v[63] = 64'h38402b101f801a1;

		scale_ar[0] = 64'hd79c6171fff9ec60;
		scale_ar[1] = 64'hc792f18d88fcabc9;
		scale_ar[2] = 64'hb13c93c20012eaa9;
		scale_ar[3] = 64'hc4ac64d9f9276dd2;
		scale_ar[4] = 64'h62fdc064b6612e1f;
		scale_ar[5] = 64'hfdbef6c0dc898073;
		scale_ar[6] = 64'hf5e510a69c5a8f8a;
		scale_ar[7] = 64'h55c9f625938552a3;
		scale_ar[8] = 64'h26f682079d539cee;
		scale_ar[9] = 64'hfa26c765102610ef;
		scale_ar[10] = 64'ha87d1fc7390f156c;
		scale_ar[11] = 64'ha6a1eecf4f15c197;
		scale_ar[12] = 64'h4a3f039747db4bd;
		scale_ar[13] = 64'h253f3e70ed6feee4;
		scale_ar[14] = 64'h853b77a45b2b3a79;
		scale_ar[15] = 64'h863d8a05d0e05e5;

		// Wait 100 ns for global reset to finish
		#100;

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;

        
		// Add stimulus here
		for(i=0; i<120; i=i+1)
		begin
			@(posedge clk);
			address_ext = i; dina_ext = ct[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;

		// Call BS2POLVECp
		@(posedge clk)
		command_in = {10'd512,10'd0,10'd0,5'd9};
		command_we0 = 1; command_we1 = 0;
		wait(done_bs2polvecp);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_bs2polvecp);
		@(posedge clk);
		

/*
	SABER_un_pack4bit(scale_ar, op);
	for(i=0;i<SABER_N;i++)
		v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (mod_p) ) >> (SABER_EP-1);
	
	POL2MSG(v, message_dec);
*/

		for(i=0; i<16; i=i+1)
		begin
			@(posedge clk);
			address_ext = i; dina_ext = scale_ar[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;

		for(i=0; i<64; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+16; dina_ext = v[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;

		@(posedge clk)
		command_in = {10'd512,10'd0,10'd16,5'd11};
		command_we0 = 1; command_we1 = 0;
		wait(done_unpack);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_unpack);
		@(posedge clk);

	end
   always #5 clk = ~clk;   
endmodule

