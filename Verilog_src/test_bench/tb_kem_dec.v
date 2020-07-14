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

module tb_kem_dec;

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
	
	reg [63:0] ct[119:0], scale_ar[15:0], buf_extra[3:0];
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
		ct[0] = 64'he0ea0043eafd6acb;
		ct[1] = 64'h489def24bdb37011;
		ct[2] = 64'haf5726361ad35df9;
		ct[3] = 64'h869b72f8d022960d;
		ct[4] = 64'he1c24814e1b916c3;
		ct[5] = 64'hdadde2c5e5f3ea48;
		ct[6] = 64'hecfcf594fca4c84a;
		ct[7] = 64'hf1139f91b094f648;
		ct[8] = 64'hd4d2598770222071;
		ct[9] = 64'h2a9bcc62df7c9f80;
		ct[10] = 64'h3dac2e833dd2868e;
		ct[11] = 64'h926f6ea2baef8629;
		ct[12] = 64'h54aa2408f6fa638;
		ct[13] = 64'ha6b6a017027bda9d;
		ct[14] = 64'h47ecc5d8070c35c1;
		ct[15] = 64'hd62955f8d76550eb;
		ct[16] = 64'h622e3d3a880b2145;
		ct[17] = 64'h485ddc46ee29c0f2;
		ct[18] = 64'hd8b7f4212b3026ab;
		ct[19] = 64'hdf29331b0008c23a;
		ct[20] = 64'h7f0be5f2b2ec829a;
		ct[21] = 64'hc2a5d09941177614;
		ct[22] = 64'h40198dabf1e76f12;
		ct[23] = 64'h75e4411e1daf2ef;
		ct[24] = 64'he2a16a6204d939d9;
		ct[25] = 64'h91bfa84f9bbccef7;
		ct[26] = 64'h6685d3c63d5a429d;
		ct[27] = 64'h6fad73a0ca89e48d;
		ct[28] = 64'h6f7af6e47edf6dd1;
		ct[29] = 64'h2338a540a7e240b3;
		ct[30] = 64'h7b0b41a0eb0e3c0c;
		ct[31] = 64'h8692fcf511afd671;
		ct[32] = 64'h83dc6b5c7465fe09;
		ct[33] = 64'h25fcf6df51536dbc;
		ct[34] = 64'hb7eaf74c0038601;
		ct[35] = 64'hf9f6250c93c0f599;
		ct[36] = 64'hbc9439fb6e715dbe;
		ct[37] = 64'h96f4382a94415e70;
		ct[38] = 64'h9cc1f70b071caf94;
		ct[39] = 64'h30be42273feb5540;
		ct[40] = 64'h396a7a0e5feb6732;
		ct[41] = 64'hb192005f5935e520;
		ct[42] = 64'h93275c178a510013;
		ct[43] = 64'hfcd68120445af1e6;
		ct[44] = 64'he77f3d51edaa0ab5;
		ct[45] = 64'hf5e5f93edc2ae421;
		ct[46] = 64'h312a2a53df4543a5;
		ct[47] = 64'h77b1780080291b08;
		ct[48] = 64'hacc50c7d36653f51;
		ct[49] = 64'heb4cb6f7dd4102a5;
		ct[50] = 64'h38e3940d5c1866c0;
		ct[51] = 64'h8f09d13901aad34e;
		ct[52] = 64'hd9e20c42996afbad;
		ct[53] = 64'h9ad3ad5d39cad4b5;
		ct[54] = 64'h95485ef2b239c396;
		ct[55] = 64'h34147ce37d45eba5;
		ct[56] = 64'ha2d6eaa2f49e55e2;
		ct[57] = 64'h4e5d43bb200c681;
		ct[58] = 64'h9abb8968ebbf9f58;
		ct[59] = 64'hbd9ac71ceb2dfcb6;
		ct[60] = 64'h60fe543947eb1024;
		ct[61] = 64'hbb08eb4a819aeaf;
		ct[62] = 64'hfb2cbde0d1788a62;
		ct[63] = 64'h9a540730ca6ff67f;
		ct[64] = 64'h699c221077dea577;
		ct[65] = 64'hb9d975b590525abf;
		ct[66] = 64'h2c6c6ecb95629ebd;
		ct[67] = 64'h76956576c39db583;
		ct[68] = 64'h4fa6f2a9bbe58fb;
		ct[69] = 64'h2dfcc7338e6a9b2e;
		ct[70] = 64'h91099c47ed7862ce;
		ct[71] = 64'h2e0578e1f66fe08;
		ct[72] = 64'hff078e1c571e4132;
		ct[73] = 64'h3d9d9e017c8b80c3;
		ct[74] = 64'ha8689cfa5fb9dbbb;
		ct[75] = 64'h58e202f31d5c195d;
		ct[76] = 64'ha6f043b5a5dbe38a;
		ct[77] = 64'hf908cdcc39cee989;
		ct[78] = 64'hf584716daa32ae63;
		ct[79] = 64'h6ac345c8c1ed86a;
		ct[80] = 64'hda548ae86e8ca1d9;
		ct[81] = 64'hbd40f04d620db8e3;
		ct[82] = 64'h2895672155b2e8a5;
		ct[83] = 64'h15b043385e624019;
		ct[84] = 64'h93b474d1f21e1480;
		ct[85] = 64'hf52db42167df4233;
		ct[86] = 64'hf466b8c751517b22;
		ct[87] = 64'ha0877156bdc1402b;
		ct[88] = 64'h6a24eb3949d33e1f;
		ct[89] = 64'hb4af3831e626a6dd;
		ct[90] = 64'hae31630bee2ba73e;
		ct[91] = 64'h87fc153d406ea487;
		ct[92] = 64'hac054e82163eb658;
		ct[93] = 64'h545a908e59c51b48;
		ct[94] = 64'h7983c345a85cfe06;
		ct[95] = 64'h6fcf703996d68e29;
		ct[96] = 64'h7b3814cb022f3eed;
		ct[97] = 64'hbb6c2a52f8e85488;
		ct[98] = 64'hdc3dcca2fad041a7;
		ct[99] = 64'hbad7d30f9f484331;
		ct[100] = 64'h5af6c7e6ec72d141;
		ct[101] = 64'h9df0c3f864ea3ad9;
		ct[102] = 64'hea16a27a708b6500;
		ct[103] = 64'h42d0a356db4ddabf;
		ct[104] = 64'h4b147b280592036;
		ct[105] = 64'hcb5a4cb59903f46f;
		ct[106] = 64'hb592e0e508d75646;
		ct[107] = 64'h1ab2a855b25e574e;
		ct[108] = 64'ha8f60ae91df4bf54;
		ct[109] = 64'h513008134970bf7b;
		ct[110] = 64'hf46f7c691ce8fd11;
		ct[111] = 64'hcf8c4853b48f78d5;
		ct[112] = 64'hb1f93f3cec188402;
		ct[113] = 64'hb2c8cef787c04b06;
		ct[114] = 64'hbc1c5cb064001492;
		ct[115] = 64'h62099c07d0e527aa;
		ct[116] = 64'h18a1727f6f676edb;
		ct[117] = 64'hf5d96c7c291ed781;
		ct[118] = 64'he31c3f3db0878bd2;
		ct[119] = 64'h342539e16aabfbb7;
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

        buf_extra[0] = 64'he997cebe731479ba;
        buf_extra[1] = 64'h187b3987e68bf1ac;
        buf_extra[2] = 64'h55f3974eaa4b7660;
        buf_extra[3] = 64'hc33a00cac8f0a7df;
		// Wait 100 ns for global reset to finish
		#100;

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;

        
		// Add stimulus here

		// #0 <-- ciphertext
		for(i=0; i<120; i=i+1)
		begin
			@(posedge clk);
			address_ext = i; dina_ext = ct[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;

		// #120 <-- scale_ar
		for(i=0; i<16; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+120; dina_ext = scale_ar[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;

		// #136 <-- buf_extra
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+136; dina_ext = buf_extra[i]; wea_ext = 1;
		end
		@(posedge clk);
		wea_ext = 0;
		
		// Call BS2POLVECp: Unpack ciphertext to mod_p pol
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
		
			// NOTE: output coeff contains 13-bit info. Need to set the top bits to 000.
		//InnerProd(pksv,sksv,mod_p,v);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd512,5'd10};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);



/*
	SABER_un_pack4bit(scale_ar, op);
	for(i=0;i<SABER_N;i++)
		v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (mod_p) ) >> (SABER_EP-1);
	
	POL2MSG(v, message_dec);
*/


		
		@(posedge clk)
		command_in = {10'd512,10'd120,10'd0,5'd11};
		command_we0 = 1; command_we1 = 0;
		wait(done_unpack);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_unpack);
		@(posedge clk);

    
        // copy buf_extra from #768 to 
		@(posedge clk)
		command_in = {10'd516,10'd4,10'd136,5'd12};
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

