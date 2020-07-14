`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   ComputeCore3
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/saber_mult_RAM/tb_kem_dec_cca
// Project Name:  
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

module tb_kem_dec_cca;

	// Inputs
	reg clk;
	reg [9:0] address_ext;
	reg [63:0] dina_ext;
	reg wea_ext;
	reg [34:0] command_in;
	reg command_we0;
	reg command_we1;

	// Outputs
	wire [63:0] doutb_ext;
	wire done_shake;
	wire done_vmul;
	wire done_addround;
	wire done_addpack;
	wire done_bs2polvecp;
	wire done_unpack;
	wire done_copy;
	wire done_sampler;
    wire done_verify;
    wire done_cmov;
    wire done_timer;
    
	// Test values
	reg [63:0] cpa_secret[47:0];		// 3 secret polynomials where each coeff is in signed magnitude and occupies 4 bits
	reg [63:0] pk[123:0];						// 120 words are for CPA pk and the next 4 words are seed_A
	reg [63:0] hash_pk[3:0];					// 4 words are for hash(pk)	
	reg [63:0] pseudo_random[3:0]; 	// If decapsulation fails, this pseudo_random string is output
	reg [63:0] ct[135:0];						// 960 + 128 bytes
	reg [9:0] i;
	
	// Instantiate the Unit Under Test (UUT)
	ComputeCore3 uut (
		.clk(clk), 
		.address_ext(address_ext), 
		.dina_ext(dina_ext), 
		.wea_ext(wea_ext), 
		.command_in(command_in), 
		.command_we0(command_we0), 
		.command_we1(command_we1), 
		.doutb_ext(doutb_ext),
		.done_shake(done_shake), 
		.done_vmul(done_vmul), 
		.done_addround(done_addround), 
		.done_addpack(done_addpack), 
		.done_bs2polvecp(done_bs2polvecp), 
		.done_unpack(done_unpack),
		.done_copy(done_copy),
		.done_sampler(done_sampler),
		.done_verify(done_verify),
		.done_cmov(done_cmov),
		.done_timer(done_timer)		
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
	
		cpa_secret[0] = 64'h939a1019012a0091;
		cpa_secret[1] = 64'h1900922102139ba;
		cpa_secret[2] = 64'hba0ba01909010c0a;
		cpa_secret[3] = 64'h211099001a990999;
		cpa_secret[4] = 64'h9911311100092110;
		cpa_secret[5] = 64'h1aa0a191a09191b;
		cpa_secret[6] = 64'hab1190109911000;
		cpa_secret[7] = 64'hab91110310a20a3;
		cpa_secret[8] = 64'h3a14092901a9910a;
		cpa_secret[9] = 64'h920909a009032129;
		cpa_secret[10] = 64'ha9a1202020b9a11;
		cpa_secret[11] = 64'h920001111a00a390;
		cpa_secret[12] = 64'h99a00ab10191019;
		cpa_secret[13] = 64'h91a02a1aa211911;
		cpa_secret[14] = 64'h199090011a2a9199;
		cpa_secret[15] = 64'h1900911219210912;
		cpa_secret[16] = 64'h1a01019310091009;
		cpa_secret[17] = 64'hba3100191b929a11;
		cpa_secret[18] = 64'h1021000010a09000;
		cpa_secret[19] = 64'ha00a022112aa290b;
		cpa_secret[20] = 64'h99229210a1112111;
		cpa_secret[21] = 64'h9901010001a0039;
		cpa_secret[22] = 64'h2290a92a09911;
		cpa_secret[23] = 64'h1191120090100900;
		cpa_secret[24] = 64'ha039010029931930;
		cpa_secret[25] = 64'h1190009112b12a0a;
		cpa_secret[26] = 64'h119a1120013922a;
		cpa_secret[27] = 64'h211b1a9a92b9190;
		cpa_secret[28] = 64'h1301199910011;
		cpa_secret[29] = 64'h10b11220291a9209;
		cpa_secret[30] = 64'h1990110021102000;
		cpa_secret[31] = 64'ha0911290a9a94a20;
		cpa_secret[32] = 64'h1999020aaa0920a;
		cpa_secret[33] = 64'h9991122b1a032;
		cpa_secret[34] = 64'h11101b209aa11100;
		cpa_secret[35] = 64'h1911a029a992b199;
		cpa_secret[36] = 64'h1b1a01019001219c;
		cpa_secret[37] = 64'h1090a20a9291a901;
		cpa_secret[38] = 64'ha909901111a92c1;
		cpa_secret[39] = 64'h9a2a9090902a031a;
		cpa_secret[40] = 64'ha9009911b09b0a29;
		cpa_secret[41] = 64'h9000109199aa1b1a;
		cpa_secret[42] = 64'ha09a0a1111391210;
		cpa_secret[43] = 64'h110901119101999a;
		cpa_secret[44] = 64'ha011011a10212919;
		cpa_secret[45] = 64'h201111001932012;
		cpa_secret[46] = 64'ha9aa99a010912a19;
		cpa_secret[47] = 64'h21a9019919a0a902;

		// 120+4 word pk; last 4 words are hash(pk) 
		pk[0] = 64'hdb0cb67a17a9aeeb;
		pk[1] = 64'haf199f96dfb6e521;
		pk[2] = 64'ha84c0b05a31f0773;
		pk[3] = 64'he4e75a38fe9b7e90;
		pk[4] = 64'h83063bbf4ab6f1e9;
		pk[5] = 64'hce24a7d346129d61;
		pk[6] = 64'h59d86277b5c4932c;
		pk[7] = 64'haae8426989a2be47;
		pk[8] = 64'ha251bafff3b27b1e;
		pk[9] = 64'hc7a8c333917fd996;
		pk[10] = 64'h24b5e58de318fd4d;
		pk[11] = 64'h8405689185e8410e;
		pk[12] = 64'h5290d19cdf5cc624;
		pk[13] = 64'h851f72f75a8af802;
		pk[14] = 64'h7db927f9f2744106;
		pk[15] = 64'h1fa21f265fce8169;
		pk[16] = 64'h23b3793bbb74befa;
		pk[17] = 64'h81a6a605a72248a5;
		pk[18] = 64'h5c9f7af3d1eec257;
		pk[19] = 64'h35bac167a6d5a169;
		pk[20] = 64'hbb371fd2f16fbfd4;
		pk[21] = 64'h3a4beedd55930e09;
		pk[22] = 64'ha7b0a138e8cca887;
		pk[23] = 64'h8b2484b5147a7f6;
		pk[24] = 64'hdc32a1ccaf64d398;
		pk[25] = 64'h5d233c0712fb520f;
		pk[26] = 64'h1b0a1b34037b1f28;
		pk[27] = 64'h41d6d6dc64eea60b;
		pk[28] = 64'h6a2a881e47823d38;
		pk[29] = 64'ha5577542a88e9f95;
		pk[30] = 64'hd5d4f00565eef0a3;
		pk[31] = 64'ha9c2feb61f05992c;
		pk[32] = 64'ha9b826678361734e;
		pk[33] = 64'h58d0189da858f427;
		pk[34] = 64'h57e11928fbc29e9f;
		pk[35] = 64'h298c620bec72976f;
		pk[36] = 64'hba6aa2ed35fc7de8;
		pk[37] = 64'h5ba6dcaa966d51d;
		pk[38] = 64'h5b220964cfcd9c51;
		pk[39] = 64'h2d0bca433f157618;
		pk[40] = 64'h9b443aa5a59796ef;
		pk[41] = 64'h4e053fbca7eae146;
		pk[42] = 64'ha06e088cb63aa85d;
		pk[43] = 64'hb4e96529328ca9c9;
		pk[44] = 64'h23c6831bc6526d46;
		pk[45] = 64'hc9b54ce18ba2ee45;
		pk[46] = 64'h7660eff71e47456f;
		pk[47] = 64'h9988a8a73fdfe3af;
		pk[48] = 64'h88dfbfdcbf322ec6;
		pk[49] = 64'ha2108c8013456497;
		pk[50] = 64'he694eaf738fabf09;
		pk[51] = 64'hffadb8c39b130fac;
		pk[52] = 64'h3dbe30567436afc4;
		pk[53] = 64'hfe9c977e773850a7;
		pk[54] = 64'hdc1c0e4719bdc4c0;
		pk[55] = 64'h70fb42b2dc86292f;
		pk[56] = 64'hb90d3b752e33567f;
		pk[57] = 64'hf1c2879708c1688e;
		pk[58] = 64'h89521c028e3fb3db;
		pk[59] = 64'he64f2761650d44d6;
		pk[60] = 64'h3a39c9bf018614ff;
		pk[61] = 64'h74a2111adfa9501a;
		pk[62] = 64'hc2e91249f06b8047;
		pk[63] = 64'h43c98ebae7353c10;
		pk[64] = 64'h9a9fd7a0aedab432;
		pk[65] = 64'h46b15709457ead21;
		pk[66] = 64'h4f5ee67747a43b8d;
		pk[67] = 64'h3b0d90ce8010b434;
		pk[68] = 64'h4651a27169eb46cb;
		pk[69] = 64'hc8e1ac0c1da95bbd;
		pk[70] = 64'h49e6bcf110623b30;
		pk[71] = 64'h8ace6110ed92fdcc;
		pk[72] = 64'he2dee5c889e68f46;
		pk[73] = 64'hb3c1881af75c2d8c;
		pk[74] = 64'hd29979b038242fd;
		pk[75] = 64'h1ccee0025adc23e9;
		pk[76] = 64'h7a224b5054af6e6f;
		pk[77] = 64'hf59c794a193c1844;
		pk[78] = 64'h88bb526a7d01fb70;
		pk[79] = 64'hdf17b3fdc062f8df;
		pk[80] = 64'h999a574c3a5bdb;
		pk[81] = 64'h6a8a87cda0054723;
		pk[82] = 64'h8e15cb4b06e9f123;
		pk[83] = 64'he93c5f7568e4d792;
		pk[84] = 64'h6be9930e24d92c6d;
		pk[85] = 64'hb74b6f234273c6ef;
		pk[86] = 64'h6d95f092a53554fe;
		pk[87] = 64'h63091cc289d970f2;
		pk[88] = 64'had42fbb2c95ac65e;
		pk[89] = 64'hfbada8e389a4d6ab;
		pk[90] = 64'hba727e965ec53bf1;
		pk[91] = 64'h5eadf50485cccda5;
		pk[92] = 64'hbc0c8f56ffcc80e1;
		pk[93] = 64'h45db90d2fe0233cf;
		pk[94] = 64'hec41cf691281ad11;
		pk[95] = 64'hf154b1925b0eae9c;
		pk[96] = 64'hcf29f64d38d2d5c6;
		pk[97] = 64'hd32f7e54c0da00aa;
		pk[98] = 64'h33a0d5d7dae3fe7c;
		pk[99] = 64'he04d53aecdcc37f6;
		pk[100] = 64'h17d6873d2a92e609;
		pk[101] = 64'h5ea55c8852466676;
		pk[102] = 64'ha966ecabbbab9ab3;
		pk[103] = 64'hc03d5f482d8271cd;
		pk[104] = 64'h26bf255968ddf6a0;
		pk[105] = 64'h7cc02cc25388e434;
		pk[106] = 64'hdb073db95e3f1ab1;
		pk[107] = 64'heae80134639784b9;
		pk[108] = 64'h3d8770c3fb00716;
		pk[109] = 64'hb2c01f22fd617eef;
		pk[110] = 64'hd6952fd92436853a;
		pk[111] = 64'h90ac47ecb2785e06;
		pk[112] = 64'h9ec9276bc0dcc123;
		pk[113] = 64'h914bf667feb54960;
		pk[114] = 64'ha9ad185c7641e730;
		pk[115] = 64'h745ceb4a6f29f7be;
		pk[116] = 64'h2d6bb2da94c195e;
		pk[117] = 64'he6e8f10cc636f4f0;
		pk[118] = 64'ha0cb9fcd5ef9012d;
		pk[119] = 64'h397ebfc1b53c6f4f;
		pk[120] = 64'h5ebe66a7a7008807;
		pk[121] = 64'h83399ee2fcd34a24;
		pk[122] = 64'h7cf2abaac982fe9c;
		pk[123] = 64'h8f932d5653c62fcf;

        hash_pk[0] = 64'he997cebe731479ba;
        hash_pk[1] = 64'h187b3987e68bf1ac;
        hash_pk[2] = 64'h55f3974eaa4b7660;
        hash_pk[3] = 64'hc33a00cac8f0a7df;

		pseudo_random[0] = 64'hc4105f43f504f0b2;
		pseudo_random[1] = 64'h9bfd7a44481145cd;
		pseudo_random[2] = 64'h3ad0e00d7709b299;
		pseudo_random[3] = 64'h8c6871e56bbcb7cd;

		ct[0] = 64'h93ef29bf4b2b5d4d;
		ct[1] = 64'h7c76470f30174362;
		ct[2] = 64'h63cd1cf00a2aa8a3;
		ct[3] = 64'hee31ef29644057f2;
		ct[4] = 64'h84bb0b7613676b39;
		ct[5] = 64'h1090c640a94405b4;
		ct[6] = 64'hfac0320d07c611ad;
		ct[7] = 64'hf3510dc560bc2a8d;
		ct[8] = 64'hcf60f25409c506e6;
		ct[9] = 64'h7543d7971dfd0bbb;
		ct[10] = 64'hfc429b057eb826e6;
		ct[11] = 64'h7020a01e08e2bedf;
		ct[12] = 64'h5cae8760dce633b;
		ct[13] = 64'hfeb492dba0db1927;
		ct[14] = 64'h1f7a8562baab9059;
		ct[15] = 64'hb212fa63ff6319aa;
		ct[16] = 64'h802cc5f210723f3f;
		ct[17] = 64'h233f74d643095029;
		ct[18] = 64'h3f89c98e3d78731;
		ct[19] = 64'hf556523bf4d3862f;
		ct[20] = 64'h5e452708c0ba50c2;
		ct[21] = 64'h1a5fc705ddf754d8;
		ct[22] = 64'he2761f1c573fb37c;
		ct[23] = 64'hbde40ce712f94c0d;
		ct[24] = 64'h1161ddea4894754a;
		ct[25] = 64'heba53c8b0f27fe9b;
		ct[26] = 64'he8441ffc80544a80;
		ct[27] = 64'h6eb8ba766df2014b;
		ct[28] = 64'hf5f28a65aeeb75ff;
		ct[29] = 64'hb231f35a623e8c8a;
		ct[30] = 64'heb2163af655f3439;
		ct[31] = 64'h694ee07a18dc45cd;
		ct[32] = 64'hc6d01c6c028872ab;
		ct[33] = 64'h770062b633913786;
		ct[34] = 64'h351849cf8595cc9;
		ct[35] = 64'hc092dc322d2c5153;
		ct[36] = 64'h574ce2b6d4561214;
		ct[37] = 64'h52e5576686bfc244;
		ct[38] = 64'h44c6ce33067af509;
		ct[39] = 64'hc454fea9910fbd3e;
		ct[40] = 64'he140f4cf979b1a43;
		ct[41] = 64'hd6cbe0b3b04f077d;
		ct[42] = 64'h4b85178d50b40447;
		ct[43] = 64'h2c5f5b7470af913a;
		ct[44] = 64'hdd0c42195968ab0a;
		ct[45] = 64'hd975ae14d4604850;
		ct[46] = 64'ha924839e0e9dd21f;
		ct[47] = 64'h1c7d2ccb8b44e1d0;
		ct[48] = 64'hd8589425c76d1225;
		ct[49] = 64'h6a17b725ca2a52f0;
		ct[50] = 64'h5563fa636638b515;
		ct[51] = 64'h6be475368ced8189;
		ct[52] = 64'hd1575704c8271785;
		ct[53] = 64'h468347181e2a3d25;
		ct[54] = 64'h4de30b4c46496272;
		ct[55] = 64'hb42c53765d9815a7;
		ct[56] = 64'h8f8d6b3a2b9d4c7;
		ct[57] = 64'heba87e992870546b;
		ct[58] = 64'h50d9b82e538be47e;
		ct[59] = 64'hf0d8d31504e8e37b;
		ct[60] = 64'h39fa56ee34bf8b2b;
		ct[61] = 64'hb7002bd57e0e1b9f;
		ct[62] = 64'h31a3d0e413986bf6;
		ct[63] = 64'hc09511411d738a98;
		ct[64] = 64'hca354d9e520e9711;
		ct[65] = 64'h50a82b650361486;
		ct[66] = 64'h6431e72e606d6a3;
		ct[67] = 64'hc92743400d645927;
		ct[68] = 64'h6c8d95fd669f5b28;
		ct[69] = 64'h362115f49b4439ad;
		ct[70] = 64'h61526dd825c5be44;
		ct[71] = 64'he72db3842bd1d1f2;
		ct[72] = 64'hca20f758df0a039;
		ct[73] = 64'hb20e0949074af8d1;
		ct[74] = 64'h1ccdd5f862959fa7;
		ct[75] = 64'hf6e9981e3c1148c6;
		ct[76] = 64'h4b7bc5c5de2d4326;
		ct[77] = 64'hb954e7d771f7ff17;
		ct[78] = 64'h280b70b80b8f18b0;
		ct[79] = 64'hc0e4b8aacb1d97cc;
		ct[80] = 64'h301897ee8c24f456;
		ct[81] = 64'hebe266d731857b35;
		ct[82] = 64'h1d24ac7833498d95;
		ct[83] = 64'hb7674e05c80b1205;
		ct[84] = 64'h28d7788316d8a450;
		ct[85] = 64'ha1f4f416cb74d61e;
		ct[86] = 64'heaf29f043c5d5ab4;
		ct[87] = 64'h7c715c1f494a5b52;
		ct[88] = 64'hcc31367740604c11;
		ct[89] = 64'h58472d2310542955;
		ct[90] = 64'h119a66f3f65a748d;
		ct[91] = 64'h12145ac5c731eee9;
		ct[92] = 64'h59f2df7d283d5a30;
		ct[93] = 64'h89268b0f865aa71d;
		ct[94] = 64'hdbd7ed728799bd3b;
		ct[95] = 64'hc65c4bd80bf41357;
		ct[96] = 64'hb5be4cf82c8fa1b;
		ct[97] = 64'hdf4782511d6fc3b8;
		ct[98] = 64'h7e5e9bdc9ba66c72;
		ct[99] = 64'h72c0e3977940cc9c;
		ct[100] = 64'h708be7ecda03a787;
		ct[101] = 64'h59ba3eca5729b422;
		ct[102] = 64'hbcd01e446c8fcf19;
		ct[103] = 64'h1fe777dc75b44f57;
		ct[104] = 64'h5ffb14c6980b693e;
		ct[105] = 64'ha3cb5f00ebbf1549;
		ct[106] = 64'ha49544c9e180b6ba;
		ct[107] = 64'h6c87c40015abd1b8;
		ct[108] = 64'h3c695eb8782c3219;
		ct[109] = 64'h16f2e34df36d9736;
		ct[110] = 64'h52faf3bea8d10eec;
		ct[111] = 64'h6340946395fac57;
		ct[112] = 64'ha21a757caebfc4ee;
		ct[113] = 64'hb0f8f7b32032521;
		ct[114] = 64'h4a14193db7b3278b;
		ct[115] = 64'h8d67594d28da217c;
		ct[116] = 64'h9f93435b061571cd;
		ct[117] = 64'h105988e51647ddfd;
		ct[118] = 64'hdc28501da33026c6;
		ct[119] = 64'hc9ffd7b8b534de04;
		ct[120] = 64'hd0fdb0fe18120405;
		ct[121] = 64'hf84520e69051234c;
		ct[122] = 64'heea41ad5212eef72;
		ct[123] = 64'h1d63eee082d1ad8f;
		ct[124] = 64'hfa0ae90754535e13;
		ct[125] = 64'hbfa3e43692f62432;
		ct[126] = 64'hd8a21d509f9a23ee;
		ct[127] = 64'h52ceee21fd078507;
		ct[128] = 64'hd9f14046e6b44f5e;
		ct[129] = 64'h8b416093263cdd95;
		ct[130] = 64'h8d30666592ee88ff;
		ct[131] = 64'hd23177b71dea55fa;
		ct[132] = 64'h29c87a8c9bb254eb;
		ct[133] = 64'hc00dc527e92f4a5e;
		ct[134] = 64'hc7095ee82da6ddbb;
		ct[135] = 64'hc197e2d62be1c3a;



		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// Load pk[] in #0-#123 
		for(i=0; i<124; i=i+1)
		begin
			@(posedge clk);
			address_ext = i; dina_ext = pk[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load random_seed[] in #124-#127 
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+124; dina_ext = pseudo_random[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load cpa_secret[] in #128-#175
		for(i=0; i<48; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+128; dina_ext = cpa_secret[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load ct[] in #200-#335 
		for(i=0; i<136; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+200; dina_ext = ct[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load hash_pk[] in #340-#343 
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+340; dina_ext = hash_pk[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;


		// Load timing counter value at #1023
		@(posedge clk);
			address_ext = 1023; dina_ext = 64'd53; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

        /*
		// Call Timer
		@(posedge clk)
		command_in = {10'd1023,10'd1023,10'd1023,5'd17};
		command_we0 = 1; command_we1 = 0;
		wait(done_timer);
			@(posedge clk);
		@(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
        */

		// Call BS2POLVECp: Unpack ciphertext to mod_p pol
		@(posedge clk)
		command_in = {10'd512,10'd200,10'd200,5'd9};
		command_we0 = 1; command_we1 = 0;
		wait(done_bs2polvecp);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_bs2polvecp);
		@(posedge clk);
		
		// NOTE: output coeff contains 13-bit info. Actually, doesn't need to set the top bits to 000.
		// #512 <-- InnerProd(pksv,sksv,mod_p,v);
		@(posedge clk)
		command_in = {10'd512,10'd128,10'd512,5'd10};
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
		//command_in = {10'd1016,10'd320,10'd512,5'd11};
		command_in = {10'd336,10'd320,10'd512,5'd11};
		command_we0 = 1; command_we1 = 0;
		wait(done_unpack);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_unpack);
		@(posedge clk);
        
        ////////////////////////////////////////////////////////////////////////////
        ////////// END of CPA DECRYPTION    ////////////////////////////////////////
        ////////// Message is #336-#339     ////////////////////////////////////////
        
//            // Copy hash_pk from #120 to #340 
//            @(posedge clk)
//            command_in = {10'd340,10'd4,10'd120,5'd12};
//            command_we0 = 1; command_we1 = 0;
//            wait(done_copy);
//                @(posedge clk);
//            @(posedge clk)
//            command_in = {10'd0,10'd0,10'd0,5'd0};
//            command_we0 = 1; command_we1 = 0;
//            @(posedge clk);
//            wait(!done_copy);
//            @(posedge clk);
    
    
            // sha3_512(kr, buf, 64);
            @(posedge clk)
            command_in = {3'd0,16'd64,16'd64};
            command_we0 = 0; command_we1 = 1;
            @(posedge clk)
            command_in = {10'd344,10'd0,10'd336,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_in = {10'd344,10'd0,10'd336,5'd2};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_we0 = 0; command_we1 = 0;
    
            wait(done_shake);
                @(posedge clk);
                
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
            //// sha3_512(kr, buf, 64); done;.        
        
        
            ////////////////////////////////////////////////////////////////////////////////////
            ////        START:   indcpa_kem_enc(buf, kr+32, pk, cmp);           ////////////////
            ////        buf: #336-#339;     kr+32: #348-#351                    ////////////////
            ////////////////////////////////////////////////////////////////////////////////////
            
       		// CPA_ENC_INS2: #352-#819 <--SHAKE(#120-#123): Total k*k*13*256/64 = 468 words.
            // Call SHAKE to write 3744 bytes.
            @(posedge clk)
            command_in = {3'd0,16'd3744,16'd32};
            command_we0 = 0; command_we1 = 1;
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd120,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd120,5'd3};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_we0 = 0; command_we1 = 0;
    
            wait(done_shake);
                @(posedge clk);
                
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
            //// Matrix [A] generated.


            // CPA_ENC_INS3: STEP1: #820-#915 <-- SHAKE(#348-#351).
            @(posedge clk)
            command_in = {3'd0,16'd768,16'd32};
            command_we0 = 0; command_we1 = 1;
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_in = {10'd820,10'd0,10'd348,5'd3};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk)
            command_we0 = 0; command_we1 = 0;
    
            wait(done_shake);
                @(posedge clk);
                
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
    
            // sk is residing at #820-#867     
            // CPA_ENC_INS3: STEP2: #820-#867 <--SAMPLING(#820-#915))
            @(posedge clk)
            command_in = {10'd820,10'd0,10'd820,5'd13};
            command_we0 = 1; command_we1 = 0;
            wait(done_sampler);
                @(posedge clk);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk);
            wait(!done_sampler);
                @(posedge clk);
            
            
		        // CPA_ENC_INS4: #200-#391 <--[A][s]
                // Matrix multiplication [res] <-- [A]*[s]
                // [A] is from #352-#819  (old #200-#667).
                // [s] is from #820-#867  (old #668-#715).
        
                // #352 <-- A[row0]*[s]    where row0 starts from address 352
                @(posedge clk)
                command_in = {10'd352,10'd820,10'd352,5'd6};
                command_we0 = 1; command_we1 = 0;
                wait(done_vmul);
                    @(posedge clk);
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
                @(posedge clk);
                wait(!done_vmul);
                @(posedge clk);
                
                // #352+64 <-- A[row1]*[s]    where row1 starts from address 352+52*3=508
                @(posedge clk)
                command_in = {10'd416,10'd820,10'd508,5'd6};
                command_we0 = 1; command_we1 = 0;
                wait(done_vmul);
                    @(posedge clk);
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
                @(posedge clk);
                wait(!done_vmul);
                @(posedge clk);
        
                // #352+64+64 <-- A[row2]*[s]    where row2 starts from address 352+52*6=664
                @(posedge clk)
                command_in = {10'd480,10'd820,10'd664,5'd6};
                command_we0 = 1; command_we1 = 0;
                wait(done_vmul);
                    @(posedge clk);
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
                @(posedge clk);
                wait(!done_vmul);
                @(posedge clk);



            // CPA_ENC_INS5: #868-#987 <--POLVEC2BS(#352-#543);
            // Next few words will be used to store additional ciphertext info.
            
//                for(i=0;i<SABER_K;i++){ //shift right 3 bits
//                    for(j=0;j<SABER_N;j++){
//                        res[i][j]=( res[i][j]+ h1 ) & mod_q;
//                        res[i][j]=(res[i][j]>> (SABER_EQ-SABER_EP) );
//                    }
//                }
//                POLVEC2BS(ciphertext, res, SABER_P);
            
            @(posedge clk)
            command_in = {10'd868,10'd0,10'd352,5'd7};
            command_we0 = 1; command_we1 = 0;
            wait(done_addround);
                @(posedge clk);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk);
            wait(!done_addround);
            @(posedge clk);
    
            //client matrix-vector multiplication ends//
            // Ciphertext is now in #868-#987


            // CPA_ENC_INS6: #352-#543 <-- BS2POLVEC(#0-#119);
            // BS2POLVEC(pk,pkcl,SABER_P);
            
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd0,5'd9};
            command_we0 = 1; command_we1 = 0;
            wait(done_bs2polvecp);
                @(posedge clk);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk);
            wait(!done_bs2polvecp);
            @(posedge clk);
    
    
            // CPA_ENC_INS7: #352-#415 <-- InnerProd(#352-#543, #820-#867);
            // vector-vector scalar multiplication with mod p
            // InnerProd(pkcl,skpv1,mod_p,vprime);
            // #352 <-- [pkcl]*[s]	where row0 starts from address 4
    
            @(posedge clk)
            command_in = {10'd352,10'd820,10'd352,5'd10};
            command_we0 = 1; command_we1 = 0;
            wait(done_vmul);
                @(posedge clk);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk);
            wait(!done_vmul);
            @(posedge clk);


            // Large Instruction
            // CPA_ENC_INS8: #920-#935 <-- (#352-#415);	
            
//            //addition of h1 to vprime
//            for(i=0;i<SABER_N;i++)
//                vprime[i]=vprime[i]+h1;
    
//            // unpack message_received;
//            for(j=0; j<SABER_KEYBYTES; j++)
//            {
//                for(i=0; i<8; i++)
//                {
//                    message[8*j+i] = ((message_received[j]>>i) & 0x01);
//                }
//            }
//            // message encoding
//            for(i=0; i<SABER_N; i++)
//            {
//                message[i] = (message[i]<<(SABER_EP-1));		
//            }
//            for(k=0;k<SABER_N;k++)
//            {
//                vprime[k]=( (vprime[k] - message[k]) & (mod_p) )>>(SABER_EP-SABER_ET);
//            }
//            SABER_pack_4bit(msk_c, vprime);
            
        
            @(posedge clk)
            command_in = {10'd988,10'd336,10'd352,5'd8};
            command_we0 = 1; command_we1 = 0;
            wait(done_addpack);
                @(posedge clk);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
            @(posedge clk);
            wait(!done_addpack);
            @(posedge clk);
    

		// INS9: #348-#351 <-- SHA256(#200-#335)
		// sha3_256(kr+32, c, SABER_BYTES_CCA_DEC); 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd1088};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd348,10'd0,10'd200,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd348,10'd0,10'd200,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// INS10: #1004-#1007 <-- SHA256(#344-#351)
		// sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd64};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd1004,10'd0,10'd344,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd1004,10'd0,10'd344,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;




		// verify;
		//verify_true = verify(c, cmp, SABER_BYTES_CCA_DEC); 
		// c is 136 words long and is from #200
		// cmp is 136 words long and is from #868
		@(posedge clk)
		command_in = {3'd0,16'd0,16'd136};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd868,10'd200,5'd14};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_verify);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;

        // cmov(kr, sk+SABER_SECRETKEYBYTES-SABER_KEYBYTES, SABER_KEYBYTES, fail); 
		@(posedge clk)
        command_in = {10'd1008,10'd1004,10'd124,5'd15};
        command_we0 = 1; command_we1 = 0;

		@(posedge clk)
        command_we0 = 0; command_we1 = 0;

        wait(done_cmov);
            @(posedge clk);

        
	end
   always #5 clk = ~clk;
      
endmodule

