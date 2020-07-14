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

module tb_compute_wrapper_new;

	// Inputs
	reg clk;
	reg [31:0] control_low_word, control_high_word;
	reg [31:0] dina_ext_low_word, dina_ext_high_word;


	// Outputs
	wire [31:0] dout_ext_low_word, dout_ext_high_word;
	wire [31:0] status;
    
	// Test values
	//reg [63:0] random_seed[3:0];
	reg [63:0] pk[127:0];	// 992 byte pk for SABER_k=3
	reg [9:0] i;

	reg [9:0] address_ext;
	reg wea_ext;
	reg command_we0;
	reg command_we1;
	reg [31:0] status_reg;
	
	// Instantiate the Unit Under Test (UUT)	
	ComputeCoreWrapper uut(
			.clk(clk), 
			.control_low_word(control_low_word), 
			.control_high_word(control_high_word), 
            .dina_ext_low_word(dina_ext_low_word), 
			.dina_ext_high_word(dina_ext_high_word), 
            .dout_ext_low_word(dout_ext_low_word), 
			.dout_ext_high_word(dout_ext_high_word), 
            .status(status)
		);


	initial begin
		// Initialize Inputs
		clk = 0;
		address_ext = 0;
		wea_ext = 0;
		dina_ext_low_word = 0;
		dina_ext_high_word = 0;
		command_we0 = 0;
		command_we1 = 0;

		control_low_word = 0; 
		control_high_word = 0;
		dina_ext_low_word = 0; 
		dina_ext_high_word = 0;
	
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
		pk[124] = 64'hb01ad4280719778;
		pk[125] = 64'hf0dedd135de98bc9;
		pk[126] = 64'hc7af6f4295ab3365;
		pk[127] = 64'h6245b7ad99cd7649;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
			wea_ext = 0; address_ext = 10'd0;
			control_low_word = {21'b0, wea_ext, address_ext};
			control_high_word = 32'd1;


			/*
				//assign address_ext = control[9:0];
				//assign wea_ext = control[10];
				//assign command_in = control[45:11];
				//assign command_we0 = control[46];
				//assign command_we1 = control[47];
			*/

		// Load pk[] in #0-#127
		for(i=0; i<124+4; i=i+1)
		begin
			@(posedge clk);
				address_ext = i; {dina_ext_high_word,dina_ext_low_word}=pk[i]; wea_ext = 1;
				control_low_word = {21'b0, wea_ext, address_ext};
				control_high_word = 32'd1;
		end




        ////////////////////////////////////////////////////////////////////////////////////
        // Load Program                                                                //      
        ////////////////////////////////////////////////////////////////////////////////////
            /*
			@(posedge clk);
            address_ext = 0; {dina_ext_high_word,dina_ext_low_word}=37'd0; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
			@(posedge clk);
            address_ext = 1; {dina_ext_high_word,dina_ext_low_word}={1'b0,1'b1,10'd0,10'd0,10'd0,5'd0}; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
			@(posedge clk);
            address_ext = 2; {dina_ext_high_word,dina_ext_low_word}={1'b1,1'b0,3'd0,16'd32,16'd32}; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
			@(posedge clk);
            address_ext = 3; {dina_ext_high_word,dina_ext_low_word}={1'b0,1'b1,10'd124,10'd0,10'd124,5'd1}; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
			@(posedge clk);
            address_ext = 4; {dina_ext_high_word,dina_ext_low_word}={1'b0,1'b1,10'd0,10'd0,10'd0,5'd0}; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            */
            /*
			@(posedge clk);
            address_ext = 5; {dina_ext_high_word,dina_ext_low_word}={1'b0,1'b1,10'd0,10'd0,10'd0,5'd31}; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            */    

		// INS2: #128-#131 <-- HASH(#0-#119)
		// sha3_256(buf+32, pk, SABER_INDCPA_PUBLICKEYBYTES);
            @(posedge clk);
            address_ext = 6; {dina_ext_high_word,dina_ext_low_word}=37'd0; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 7; {dina_ext_high_word,dina_ext_low_word}=37'd0; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;

            @(posedge clk);
            address_ext = 8; {dina_ext_high_word,dina_ext_low_word}=37'h0800000000; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 9; {dina_ext_high_word,dina_ext_low_word}=37'h100ea00020; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 10; {dina_ext_high_word,dina_ext_low_word}=37'h0918000f03; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 11; {dina_ext_high_word,dina_ext_low_word}=37'h0800000000; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 12; {dina_ext_high_word,dina_ext_low_word}=37'h000000001f; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;

    /*
            @(posedge clk);
            //address_ext = 8; {dina_ext_high_word,dina_ext_low_word}=37'h10002003e0; wea_ext = 1;
            address_ext = 8; {dina_ext_high_word,dina_ext_low_word}=37'h1000200087; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 9; {dina_ext_high_word,dina_ext_low_word}=37'h0900000000; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 10; {dina_ext_high_word,dina_ext_low_word}=37'h0900000001; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 11; {dina_ext_high_word,dina_ext_low_word}=37'h0100000001; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 12; {dina_ext_high_word,dina_ext_low_word}=37'h0800000000; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
            @(posedge clk);
            address_ext = 13; {dina_ext_high_word,dina_ext_low_word}=37'h000000001f; wea_ext = 1;
            control_low_word = {21'b1, wea_ext, address_ext};
            control_high_word = 32'd1;
    */

           for(i=14; i<64; i=i+1)
            begin
                @(posedge clk);
                    address_ext = i; {dina_ext_high_word,dina_ext_low_word}=37'd0; wea_ext = 1;
                    control_low_word = {21'b1, wea_ext, address_ext};
                    control_high_word = 32'd1;
            end
        


        ////////////////////////////////////////////////////////////////////////////////////
        // Execute Program                                                                //      
        ////////////////////////////////////////////////////////////////////////////////////
		// set wea_ext=0
		@(posedge clk);
			address_ext = 0; {dina_ext_high_word,dina_ext_low_word}=pk[127]; wea_ext = 0;
			control_low_word = {21'b0, wea_ext, address_ext};
			control_high_word = 32'd1;

	

		// COMPUTE: program
		@(posedge clk);
			address_ext = 0; {dina_ext_high_word,dina_ext_low_word}=pk[127]; wea_ext = 0;
			control_low_word = {21'b0, wea_ext, address_ext};
			control_high_word = 32'd2;		

		wait(status_reg[0]);
			@(posedge clk);
		
		// RESET COMPUTE
//		@(posedge clk);
//			address_ext = 0; {dina_ext_high_word,dina_ext_low_word}=64'd0; wea_ext = 0;
//			control_low_word = {21'b0, wea_ext, address_ext};
//			control_high_word = 32'd0;

		for(i=0; i<132; i=i+1)
		begin
			@(posedge clk);
				address_ext = i; wea_ext = 0;
				control_low_word = {21'b0, wea_ext, address_ext};
				control_high_word = 32'd1;
		end


	end
   always #10 clk = ~clk;
   always @(posedge clk)
			status_reg <= status;
endmodule

