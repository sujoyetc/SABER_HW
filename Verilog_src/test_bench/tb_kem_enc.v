`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:23:51 08/10/2019
// Design Name:   ComputeCore3
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/saber_mult_RAM/tb_kem_enc.v
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

module tb_kem_enc;

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
    wire done_copy;
    wire done_sampler;
    
	// Test values
	reg [255:0] random_seed;
	reg [64:0] pt[123:0]; // pk byte string + 256 bit seed
	reg [63:0] noiseseed[3:0];
	reg [3327:0] pkcl0, pkcl1, pkcl2; // 13 bit formatted strings of pk (3 bit 0s + 10 bit coeff)
	reg [8:0] i;
	reg [256:0] message;
	
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
	
		// 32 byte random seed
		random_seed = {64'h6245b7ad99cd7649,64'hc7af6f4295ab3365,64'hf0dedd135de98bc9,64'hb01ad4280719778};

        noiseseed[0] = 64'h6d44b927b65fb0af;
        noiseseed[1] = 64'h41be679dd5c42353;
        noiseseed[2] = 64'h7add09f05a6c1f8b;
        noiseseed[3] = 64'h8c3ef9416d8c0653;

		//Second sha input:
		pt[0]=64'hdb0cb67a17a9aeeb;
		pt[1]=64'haf199f96dfb6e521;
		pt[2]=64'ha84c0b05a31f0773;
		pt[3]=64'he4e75a38fe9b7e90;
		pt[4]=64'h83063bbf4ab6f1e9;
		pt[5]=64'hce24a7d346129d61;
		pt[6]=64'h59d86277b5c4932c;
		pt[7]=64'haae8426989a2be47;
		pt[8]=64'ha251bafff3b27b1e;
		pt[9]=64'hc7a8c333917fd996;
		pt[10]=64'h24b5e58de318fd4d;
		pt[11]=64'h8405689185e8410e;
		pt[12]=64'h5290d19cdf5cc624;
		pt[13]=64'h851f72f75a8af802;
		pt[14]=64'h7db927f9f2744106;
		pt[15]=64'h1fa21f265fce8169;
		pt[16]=64'h23b3793bbb74befa;
		pt[17]=64'h81a6a605a72248a5;
		pt[18]=64'h5c9f7af3d1eec257;
		pt[19]=64'h35bac167a6d5a169;
		pt[20]=64'hbb371fd2f16fbfd4;
		pt[21]=64'h3a4beedd55930e09;
		pt[22]=64'ha7b0a138e8cca887;
		pt[23]=64'h8b2484b5147a7f6;
		pt[24]=64'hdc32a1ccaf64d398;
		pt[25]=64'h5d233c0712fb520f;
		pt[26]=64'h1b0a1b34037b1f28;
		pt[27]=64'h41d6d6dc64eea60b;
		pt[28]=64'h6a2a881e47823d38;
		pt[29]=64'ha5577542a88e9f95;
		pt[30]=64'hd5d4f00565eef0a3;
		pt[31]=64'ha9c2feb61f05992c;
		pt[32]=64'ha9b826678361734e;
		pt[33]=64'h58d0189da858f427;
		pt[34]=64'h57e11928fbc29e9f;
		pt[35]=64'h298c620bec72976f;
		pt[36]=64'hba6aa2ed35fc7de8;
		pt[37]=64'h5ba6dcaa966d51d;
		pt[38]=64'h5b220964cfcd9c51;
		pt[39]=64'h2d0bca433f157618;
		pt[40]=64'h9b443aa5a59796ef;
		pt[41]=64'h4e053fbca7eae146;
		pt[42]=64'ha06e088cb63aa85d;
		pt[43]=64'hb4e96529328ca9c9;
		pt[44]=64'h23c6831bc6526d46;
		pt[45]=64'hc9b54ce18ba2ee45;
		pt[46]=64'h7660eff71e47456f;
		pt[47]=64'h9988a8a73fdfe3af;
		pt[48]=64'h88dfbfdcbf322ec6;
		pt[49]=64'ha2108c8013456497;
		pt[50]=64'he694eaf738fabf09;
		pt[51]=64'hffadb8c39b130fac;
		pt[52]=64'h3dbe30567436afc4;
		pt[53]=64'hfe9c977e773850a7;
		pt[54]=64'hdc1c0e4719bdc4c0;
		pt[55]=64'h70fb42b2dc86292f;
		pt[56]=64'hb90d3b752e33567f;
		pt[57]=64'hf1c2879708c1688e;
		pt[58]=64'h89521c028e3fb3db;
		pt[59]=64'he64f2761650d44d6;
		pt[60]=64'h3a39c9bf018614ff;
		pt[61]=64'h74a2111adfa9501a;
		pt[62]=64'hc2e91249f06b8047;
		pt[63]=64'h43c98ebae7353c10;
		pt[64]=64'h9a9fd7a0aedab432;
		pt[65]=64'h46b15709457ead21;
		pt[66]=64'h4f5ee67747a43b8d;
		pt[67]=64'h3b0d90ce8010b434;
		pt[68]=64'h4651a27169eb46cb;
		pt[69]=64'hc8e1ac0c1da95bbd;
		pt[70]=64'h49e6bcf110623b30;
		pt[71]=64'h8ace6110ed92fdcc;
		pt[72]=64'he2dee5c889e68f46;
		pt[73]=64'hb3c1881af75c2d8c;
		pt[74]=64'hd29979b038242fd;
		pt[75]=64'h1ccee0025adc23e9;
		pt[76]=64'h7a224b5054af6e6f;
		pt[77]=64'hf59c794a193c1844;
		pt[78]=64'h88bb526a7d01fb70;
		pt[79]=64'hdf17b3fdc062f8df;
		pt[80]=64'h999a574c3a5bdb;
		pt[81]=64'h6a8a87cda0054723;
		pt[82]=64'h8e15cb4b06e9f123;
		pt[83]=64'he93c5f7568e4d792;
		pt[84]=64'h6be9930e24d92c6d;
		pt[85]=64'hb74b6f234273c6ef;
		pt[86]=64'h6d95f092a53554fe;
		pt[87]=64'h63091cc289d970f2;
		pt[88]=64'had42fbb2c95ac65e;
		pt[89]=64'hfbada8e389a4d6ab;
		pt[90]=64'hba727e965ec53bf1;
		pt[91]=64'h5eadf50485cccda5;
		pt[92]=64'hbc0c8f56ffcc80e1;
		pt[93]=64'h45db90d2fe0233cf;
		pt[94]=64'hec41cf691281ad11;
		pt[95]=64'hf154b1925b0eae9c;
		pt[96]=64'hcf29f64d38d2d5c6;
		pt[97]=64'hd32f7e54c0da00aa;
		pt[98]=64'h33a0d5d7dae3fe7c;
		pt[99]=64'he04d53aecdcc37f6;
		pt[100]=64'h17d6873d2a92e609;
		pt[101]=64'h5ea55c8852466676;
		pt[102]=64'ha966ecabbbab9ab3;
		pt[103]=64'hc03d5f482d8271cd;
		pt[104]=64'h26bf255968ddf6a0;
		pt[105]=64'h7cc02cc25388e434;
		pt[106]=64'hdb073db95e3f1ab1;
		pt[107]=64'heae80134639784b9;
		pt[108]=64'h3d8770c3fb00716;
		pt[109]=64'hb2c01f22fd617eef;
		pt[110]=64'hd6952fd92436853a;
		pt[111]=64'h90ac47ecb2785e06;
		pt[112]=64'h9ec9276bc0dcc123;
		pt[113]=64'h914bf667feb54960;
		pt[114]=64'ha9ad185c7641e730;
		pt[115]=64'h745ceb4a6f29f7be;
		pt[116]=64'h2d6bb2da94c195e;
		pt[117]=64'he6e8f10cc636f4f0;
		pt[118]=64'ha0cb9fcd5ef9012d;
		pt[119]=64'h397ebfc1b53c6f4f;
		pt[120]=64'h5ebe66a7a7008807;
		pt[121]=64'h83399ee2fcd34a24;
		pt[122]=64'h7cf2abaac982fe9c;
		pt[123]=64'h8f932d5653c62fcf;

		pkcl0=3328'd14783032167533851035891449974680945393893499638184699699864380947651401515160064892416679745618730754247195166199675516490111507325221098869262524522712397649024419214391560355951124641364775141222541544867693925971045579597323386503628354166228353573966145159195557568060330784418359335413910908781981606672309586746633904899758553182581812779312111953229768940913126310377954616608100332832207986825653843913095789272234232901345355694279798646157486240298844581742778861958183825608651845660165394577748977417633105428672784366023435345277031320669827756442314813946221794691800097392101043789850804589569635897679370339246199679561580242990301569800298600535659322894211991454075277749534227799029217292329782550488481435114873139978705728673973952697338155113127305345283790672836360969074401842720250365720848175849860117013504126022270884438853157536819713701254687842632994495130187880079270634220573745045369722747187129381522926888717583816458971956947265540121101232531318894193419943240427;
		pkcl1=3328'd73252593752478396495425742388155486244944563454118398093469684288891288854861224109393271364283930439027986075563485211112344838117641520022334556381470361241679347245504162356537539771782288140044148309139912556224393599771567301858950249750508268050413266206266824758115434769329571390234364617797050133105117080574929730886661496537357867661182912096215320459082481330205414749125186995623747006174046875796195454342876643733745588379628697660747837729322227615274048054901913726912545802565567963655857047778847626607893007616907398453604885515136291106266947166806280618099123772481043603466790513744330211614511951734736925841069992453582100433614507340221318268428658624532433403880588888254069127051908354155229297254671124699009774855599671473916570666679731664857292193207118925415944115904494313979880238446001240125944736211738128037442083651544381574454455441191772462117105400276074556066671130078246663351416550773976018601828985964789499857464594365118890724076606569038529889287578351;
		pkcl2=3328'd18814958882962205466149539784261517811243342269706724996146341786501770067329610081264555707270829190058136441527314491771835698943386982580311572706433754851997104306051696281716231194568367435488467114302417511888892390695644072410249632231893540202928787261463382528408104667191387707464771835645615243000450196450127284876904675397363495370326694935085793159089794420029018106948604620843404125418973620928275787884325915374624352531570325448935102627863241027524168258942053367191656868698983328914352180057449529150387211840466475122316340951105244901322242796067049578748687743599296198379609035425388031006759503007040317529550030535155015114155161303974520693634456426832639547405232779693589848454548770001488267301946527459130311516466943581503766980725792530064413033369804450870500811007078671974869236971048163366672212049673454129645330026976034012255852468395708778505417260342172001833691029599921807212938203102431198890654001640282897748569993103430031387637118054595812101293523931;
		message = {64'h73a8f88019e7832,64'h4999a4a5af8ab4b,64'h81871bf54075ae5a,64'h194a349f7c22cfcd};

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
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
	end
   always #5 clk = ~clk;
      
endmodule

