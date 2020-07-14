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

module tb_kem_enc_commands2int;

	// Inputs
	reg clk;
	reg [34:0] command_in;
	reg	command_we0, command_we1;	
	reg [36:0] instruction;

	initial begin
		// Initialize Inputs
		clk = 0;
		command_in = 0;
		command_we0 = 0;
		command_we1 = 0;
	
		// Wait 100 ns for global reset to finish
		#100;

		@(posedge clk)
		command_in = {3'd0,16'd0,16'd0};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {3'd0,16'd0,16'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
        
		// INS1: #124-#127 <-- HASH(#124-#127)
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd32};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd124,10'd0,10'd124,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd124,10'd0,10'd124,5'd1};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		

		// INS2: #128-#131 <-- HASH(#0-#119)
		// sha3_256(buf+32, pk, SABER_INDCPA_PUBLICKEYBYTES);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd992};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd128,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd128,10'd0,10'd0,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd128,10'd0,10'd0,5'd1};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// INS3: #132-#139 <-- SHA512(#124-#131)		
		// sha3_512(kr, buf, 64);
		@(posedge clk)
		command_in = {3'd0,16'd64,16'd64};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd132,10'd0,10'd124,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd132,10'd0,10'd124,5'd2};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd132,10'd0,10'd124,5'd2};		
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		

		// NOW we have: buf[] is from #124-#131
		// NOW we have: kr[] is from #132-#139
		// buf[0:31] contains 32-byte message; kr[32:63] contains 32-byte randomness r;

		// CPA_ENC_INS2: #200-#667 <--SHAKE(#120-#123): Total k*k*13*256/64 = 468 words.
		// Call SHAKE to write 3744 bytes.
		@(posedge clk)
		command_in = {3'd0,16'd3744,16'd32};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd120,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd120,5'd3};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd120,5'd3};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		//// Matrix [A] generated.


		// CPA_ENC_INS3: STEP1: #668-#763 <-- SHAKE(#136-#139).
		@(posedge clk)
		command_in = {3'd0,16'd768,16'd32};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd668,10'd0,10'd136,5'd3};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd668,10'd0,10'd136,5'd3};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		


		// CPA_ENC_INS3: STEP2: #668-#715 <--SAMPLING(#668-#763))
		@(posedge clk)
		command_in = {10'd668,10'd0,10'd668,5'd13};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		// CPA_ENC_INS4: #200-#391 <--[A][s]
		// Matrix multiplication [res] <-- [A]*[s]
		// [A] is from #200-#667.
		// [s] is from #668-#715

		// #200 <-- A[row0]*[s]	where row0 starts from address 200
		@(posedge clk)
		command_in = {10'd200,10'd668,10'd200,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// #200+64 <-- A[row1]*[s]	where row1 starts from address 200+52*3=356
		@(posedge clk)
		command_in = {10'd264,10'd668,10'd356,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// #200+64+64 <-- A[row2]*[s]	where row2 starts from address 296+52*6=316
		@(posedge clk)
		command_in = {10'd328,10'd668,10'd512,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

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
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		//**********client matrix-vector multiplication ends*******************//
		// Ciphertext is now in #800-#919


		// CPA_ENC_INS6: #200-#391 <-- BS2POLVEC(#0-#119);
		// BS2POLVEC(pk,pkcl,SABER_P);
		
		@(posedge clk)
		command_in = {10'd200,10'd0,10'd0,5'd9};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		// CPA_ENC_INS7: #200-#263 <-- InnerProd(#200-#391, #668-#715);
		// vector-vector scalar multiplication with mod p
		// InnerProd(pkcl,skpv1,mod_p,vprime);
		// #200 <-- [pkcl]*[s]	where row0 starts from address 4

		@(posedge clk)
		command_in = {10'd200,10'd668,10'd200,5'd10};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

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
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		// INS9: #136-#139 <-- SHA256(#800-#935)
		// sha3_256(kr+32, c, SABER_BYTES_CCA_DEC); 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd1088};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd136,10'd0,10'd800,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd136,10'd0,10'd800,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd136,10'd0,10'd800,5'd1};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		// INS10: #936-#939 <-- SHA256(#132-#139)
		// sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd64};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd936,10'd0,10'd132,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd936,10'd0,10'd132,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd936,10'd0,10'd132,5'd1};
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = 35'd31;
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
	end
   always #5 clk = ~clk;
      
endmodule

