`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:23:51 08/10/2019
// Design Name:   ComputeCore3
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/saber_mult_RAM/tb_kem_enc_new.v
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

module tb_kem_enc_new;

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
    
	// Test values
	reg [63:0] random_seed[3:0];
	reg [63:0] pk[123:0];	// 992 byte pk for SABER_k=3
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
		.done_sampler(done_sampler)
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
	
		// 120+4 word pk 
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
		// 4 word random_seed 
		random_seed[0] = 64'hb01ad4280719778;
		random_seed[1] = 64'hf0dedd135de98bc9;
		random_seed[2] = 64'hc7af6f4295ab3365;
		random_seed[3] = 64'h6245b7ad99cd7649;


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
			address_ext = i+124; dina_ext = random_seed[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;



		// INS1: #124-#127 <-- HASH(#124-#127)
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd124,10'd0,10'd124,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// INS2: #128-#131 <-- HASH(#0-#119)
		// sha3_256(buf+32, pk, SABER_INDCPA_PUBLICKEYBYTES);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd992};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd128,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd128,10'd0,10'd0,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		
		// INS3: #132-#139 <-- SHA512(#124-#131)		
		// sha3_512(kr, buf, 64);
		@(posedge clk)
		command_in = {3'd0,16'd64,16'd64};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd132,10'd0,10'd124,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd132,10'd0,10'd124,5'd2};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// NOW we have: buf[] is from #124-#131
		// NOW we have: kr[] is from #132-#139
		// buf[0:31] contains 32-byte message; kr[32:63] contains 32-byte randomness r;

		// CPA_ENC_INS2: #200-#667 <--SHAKE(#120-#123): Total k*k*13*256/64 = 468 words.
		// Call SHAKE to write 3744 bytes.
		@(posedge clk)
		command_in = {3'd0,16'd3744,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd120,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd120,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// Matrix [A] generated.

		// CPA_ENC_INS3: STEP1: #668-#763 <-- SHAKE(#136-#139).
		@(posedge clk)
		command_in = {3'd0,16'd768,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd668,10'd0,10'd136,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// CPA_ENC_INS3: STEP2: #668-#715 <--SAMPLING(#668-#763))
		@(posedge clk)
		command_in = {10'd668,10'd0,10'd668,5'd13};
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
		// [A] is from #200-#667.
		// [s] is from #668-#715

		// #200 <-- A[row0]*[s]	where row0 starts from address 200
		@(posedge clk)
		command_in = {10'd200,10'd668,10'd200,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);
		
		// #200+64 <-- A[row1]*[s]	where row1 starts from address 200+52*3=356
		@(posedge clk)
		command_in = {10'd264,10'd668,10'd356,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);

		// #200+64+64 <-- A[row2]*[s]	where row2 starts from address 200+52*6=512
		@(posedge clk)
		command_in = {10'd328,10'd668,10'd512,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);


		// CPA_ENC_INS5: #800-#919 <--POLVEC2BS(#200-#391);
		// Next few words will be used to store additional ciphertext info.
		/*
			for(i=0;i<SABER_K;i++){ //shift right 3 bits
				for(j=0;j<SABER_N;j++){
					res[i][j]=( res[i][j]+ h1 ) & mod_q;
					res[i][j]=(res[i][j]>> (SABER_EQ-SABER_EP) );
				}
			}
			POLVEC2BS(ciphertext, res, SABER_P);
		*/
		@(posedge clk)
		command_in = {10'd800,10'd0,10'd200,5'd7};
		command_we0 = 1; command_we1 = 0;
		wait(done_addround);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_addround);
		@(posedge clk);

		//**********client matrix-vector multiplication ends*******************//
		// Ciphertext is now in #800-#919


		// CPA_ENC_INS6: #200-#391 <-- BS2POLVEC(#0-#119);
		// BS2POLVEC(pk,pkcl,SABER_P);
		
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd0,5'd9};
		command_we0 = 1; command_we1 = 0;
		wait(done_bs2polvecp);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_bs2polvecp);
		@(posedge clk);


		// CPA_ENC_INS7: #200-#263 <-- InnerProd(#200-#391, #668-#715);
		// vector-vector scalar multiplication with mod p
		// InnerProd(pkcl,skpv1,mod_p,vprime);
		// #200 <-- [pkcl]*[s]	where row0 starts from address 4

		@(posedge clk)
		command_in = {10'd200,10'd668,10'd200,5'd10};
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
		// CPA_ENC_INS8: #920-#935 <-- (#200-#263);	
		/*
		//addition of h1 to vprime
		for(i=0;i<SABER_N;i++)
			vprime[i]=vprime[i]+h1;

		// unpack message_received;
		for(j=0; j<SABER_KEYBYTES; j++)
		{
			for(i=0; i<8; i++)
			{
				message[8*j+i] = ((message_received[j]>>i) & 0x01);
			}
		}
		// message encoding
		for(i=0; i<SABER_N; i++)
		{
			message[i] = (message[i]<<(SABER_EP-1));		
		}
		for(k=0;k<SABER_N;k++)
		{
			vprime[k]=( (vprime[k] - message[k]) & (mod_p) )>>(SABER_EP-SABER_ET);
		}
		SABER_pack_4bit(msk_c, vprime);
		*/
	
		@(posedge clk)
		command_in = {10'd920,10'd124,10'd200,5'd8};
		command_we0 = 1; command_we1 = 0;
		wait(done_addpack);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_addpack);
		@(posedge clk);


		// INS9: #136-#139 <-- SHA256(#800-#935)
		// sha3_256(kr+32, c, SABER_BYTES_CCA_DEC); 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd1088};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd136,10'd0,10'd800,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd136,10'd0,10'd800,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// INS10: #936-#939 <-- SHA256(#132-#139)
		// sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd64};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd936,10'd0,10'd132,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd936,10'd0,10'd132,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;




		/*
		// Just to test secret vector generation
		noiseseed[0] = 64'h6d44b927b65fb0af;
		noiseseed[1] = 64'h41be679dd5c42353;
		noiseseed[2] = 64'h7add09f05a6c1f8b;
		noiseseed[3] = 64'h8c3ef9416d8c0653;

		@(posedge clk);
		address_ext = 9'd0; dina_ext = noiseseed[0]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd1; dina_ext = noiseseed[1]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd2; dina_ext = noiseseed[2]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd3; dina_ext = noiseseed[3]; wea_ext = 1;
		@(posedge clk);
		wea_ext = 0;

		@(posedge clk)
		command_in = {3'd0,16'd768,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// SHAKE done. Secret vector generated.		

		// Generate samples
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd13};
		command_we0 = 1; command_we1 = 0;
		wait(done_sampler);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_sampler);
		@(posedge clk);
        */


		
		/*
		// randombytes(buf, 32);
		// Fill in 32 byte random seed in #0-#3
		@(posedge clk);
		address_ext = 9'd0; dina_ext = random_seed[63:0]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd1; dina_ext = random_seed[127:64]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd2; dina_ext = random_seed[191:128]; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd3; dina_ext = random_seed[255:192]; wea_ext = 1;
		@(posedge clk);
		wea_ext = 0;
		
		
		// Load pt in #16 -- # 139
		// Load pkcl0
		for(i=0; i<124; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+16; dina_ext = pt[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;
		
		// Load pkcl0 from #140
		for(i=0; i<52; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+140; dina_ext = pkcl0[63:0]; wea_ext = 1;
			pkcl0 = {64'd0,pkcl0[3327:64]};
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load pkcl1
		for(i=52; i<52*2; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+140; dina_ext = pkcl1[63:0]; wea_ext = 1;
			pkcl1 = {64'd0,pkcl1[3327:64]};
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;
		
		// Load pkcl2
		for(i=52*2; i<52*3; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+140; dina_ext = pkcl2[63:0]; wea_ext = 1;
			pkcl2 = {64'd0,pkcl2[3327:64]};
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		//// All data loading ends

		// Computation Step 1
		// sha3_256(buf,buf,32);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// sha3_256 done. randombytes(buf, 32) done;.
		

		// Computation Step 2
		// sha3_256(buf+32, pk, SABER_INDCPA_PUBLICKEYBYTES);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd992};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd4,10'd0,10'd16,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd4,10'd0,10'd16,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// sha3_256 done. randombytes(buf, 32) done;.



		// Computation Step 3: Input #0-7; output #8-15
		// sha3_512(kr, buf, 64);
		@(posedge clk)
		command_in = {3'd0,16'd64,16'd64};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd8,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd8,10'd0,10'd0,5'd2};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// sha3_512(kr, buf, 64); done;.



		// Call CPA encryption
		// Call SHAKE to write 3744 bytes starting from address 136
		// The seed part is stored in last 4 64bit words of pk
		@(posedge clk)
		command_in = {3'd0,16'd3744,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd296,10'd0,10'd136,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd296,10'd0,10'd136,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// SHAKE done. [A] generated.		
		

		// Matrix multiplication [res] <-- [A]*[s]
		// #764 <-- A[row0]*[s]	where row0 starts from address 4
		@(posedge clk)
		command_in = {10'd764,10'd0,10'd296,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);
		
		// #764+64 <-- A[row1]*[s]	where row1 starts from address 296+52*3=160
		@(posedge clk)
		command_in = {10'd828,10'd0,10'd452,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);

		// #764+64+64 <-- A[row2]*[s]	where row2 starts from address 296+52*6=316
		@(posedge clk)
		command_in = {10'd892,10'd0,10'd608,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);

		/// [A]*[s] ends
		*/
		/*
			for(i=0;i<SABER_K;i++){ //shift right 3 bits
				for(j=0;j<SABER_N;j++){
					res[i][j]=( res[i][j]+ h1 ) & mod_q;
					res[i][j]=(res[i][j]>> (SABER_EQ-SABER_EP) );
				}
			}
			POLVEC2BS(ciphertext, res, SABER_P);
		*/
		/*
		@(posedge clk)
		command_in = {10'd764,10'd0,10'd764,5'd7};
		command_we0 = 1; command_we1 = 0;
		wait(done_addround);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_addround);
		@(posedge clk);
		

		// #512 <-- [pkcl]*[s]	where row0 starts from address 4
		@(posedge clk)
		command_in = {10'd512,10'd0,10'd140,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);
		*/

		/*
		//addition of h1 to vprime
		for(i=0;i<SABER_N;i++)
			vprime[i]=vprime[i]+h1;

		// unpack message_received;
		for(j=0; j<SABER_KEYBYTES; j++)
		{
			for(i=0; i<8; i++)
			{
				message[8*j+i] = ((message_received[j]>>i) & 0x01);
			}
		}
		// message encoding
		for(i=0; i<SABER_N; i++)
		{
			message[i] = (message[i]<<(SABER_EP-1));		
		}
		for(k=0;k<SABER_N;k++)
		{
			vprime[k]=( (vprime[k] - message[k]) & (mod_p) )>>(SABER_EP-SABER_ET);
		}
		SABER_pack_4bit(msk_c, vprime);
		*/
	
		/*
		@(posedge clk)
		command_in = {10'd884,10'd0,10'd512,5'd8};
		command_we0 = 1; command_we1 = 0;
		wait(done_addpack);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_addpack);
		@(posedge clk);



		//sha3_256(kr+32, c, SABER_BYTES_CCA_DEC);  
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd1088};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd12,10'd0,10'd764,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd12,10'd0,10'd764,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		//sha3_256(k, kr, 64); 	// hash concatenation of pre-k and h(c) to k 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd64};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd8,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd8,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		*/
	end
   always #5 clk = ~clk;
      
endmodule

