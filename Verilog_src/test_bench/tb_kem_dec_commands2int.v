`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:23:51 08/10/2019
// Design Name:   ComputeCore3
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/saber_mult_RAM/tb_kem_dec_new.v
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

module tb_kem_dec_commands2int;

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



		// Call BS2POLVECp: Unpack ciphertext to mod_p pol
		@(posedge clk)
		command_in = {10'd512,10'd200,10'd200,5'd9};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		
		// NOTE: output coeff contains 13-bit info. Actually, doesn't need to set the top bits to 000.
		// #512 <-- InnerProd(pksv,sksv,mod_p,v);
		@(posedge clk)
		command_in = {10'd512,10'd128,10'd512,5'd10};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		

		/*
		SABER_un_pack4bit(scale_ar, op);
		for(i=0;i<SABER_N;i++)
			v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (mod_p) ) >> (SABER_EP-1);
		
		POL2MSG(v, message_dec);
		*/

		@(posedge clk)
		command_in = {10'd336,10'd320,10'd512,5'd11};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
        ////////////////////////////////////////////////////////////////////////////
        ////////// END of CPA DECRYPTION    ////////////////////////////////////////
        ////////// Message is #336-#339     ////////////////////////////////////////
        
 
    
            // sha3_512(kr, buf, 64);
            @(posedge clk)
            command_in = {3'd0,16'd64,16'd64};
            command_we0 = 0; command_we1 = 1;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd344,10'd0,10'd336,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd344,10'd0,10'd336,5'd2};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
            @(posedge clk)
            command_in = {10'd344,10'd0,10'd336,5'd2};
            command_we0 = 0; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
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
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd120,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd120,5'd3};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);												
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd120,5'd3};						
            command_we0 = 0; command_we1 = 0;
 						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);												
            //// Matrix [A] generated.


            // CPA_ENC_INS3: STEP1: #820-#915 <-- SHAKE(#348-#351).
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
            command_in = {10'd820,10'd0,10'd348,5'd3};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);																		
            @(posedge clk)
            command_in = {10'd820,10'd0,10'd348,5'd3};						
            command_we0 = 0; command_we1 = 0;
 						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);												
            @(posedge clk)
            command_in = 35'd0;
            command_we0 = 1; command_we1 = 0;
 						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);												
						
            // sk is residing at #820-#867     
            // CPA_ENC_INS3: STEP2: #820-#867 <--SAMPLING(#820-#915))
            @(posedge clk)
            command_in = {10'd820,10'd0,10'd820,5'd13};
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
            // [A] is from #352-#819  (old #200-#667).
            // [s] is from #820-#867  (old #668-#715).
        
                // #352 <-- A[row0]*[s]    where row0 starts from address 352
                @(posedge clk)
                command_in = {10'd352,10'd820,10'd352,5'd6};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);																				
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);								
                
                // #352+64 <-- A[row1]*[s]    where row1 starts from address 352+52*3=508
                @(posedge clk)
                command_in = {10'd416,10'd820,10'd508,5'd6};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);
								
                // #352+64+64 <-- A[row2]*[s]    where row2 starts from address 352+52*6=664
                @(posedge clk)
                command_in = {10'd480,10'd820,10'd664,5'd6};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);
                @(posedge clk)
                command_in = {10'd0,10'd0,10'd0,5'd0};
                command_we0 = 1; command_we1 = 0;
								instruction = {command_we1,command_we0,command_in};
								$display("%h,", instruction);


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
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);						
    
            //client matrix-vector multiplication ends//
            // Ciphertext is now in #868-#987


            // CPA_ENC_INS6: #352-#543 <-- BS2POLVEC(#0-#119);
            // BS2POLVEC(pk,pkcl,SABER_P);
            
            @(posedge clk)
            command_in = {10'd352,10'd0,10'd0,5'd9};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
    
    
            // CPA_ENC_INS7: #352-#415 <-- InnerProd(#352-#543, #820-#867);
            // vector-vector scalar multiplication with mod p
            // InnerProd(pkcl,skpv1,mod_p,vprime);
            // #352 <-- [pkcl]*[s]	where row0 starts from address 4
    
            @(posedge clk)
            command_in = {10'd352,10'd820,10'd352,5'd10};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);

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
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);
            @(posedge clk)
            command_in = {10'd0,10'd0,10'd0,5'd0};
            command_we0 = 1; command_we1 = 0;
						instruction = {command_we1,command_we0,command_in};
						$display("%h,", instruction);    

		// INS9: #348-#351 <-- SHA256(#200-#335)
		// sha3_256(kr+32, c, SABER_BYTES_CCA_DEC); 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd1088};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_in = {10'd348,10'd0,10'd200,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);				
		@(posedge clk)
		command_in = {10'd348,10'd0,10'd200,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);				
		@(posedge clk)
		command_in = {10'd348,10'd0,10'd200,5'd1};		
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		


		// INS10: #1004-#1007 <-- SHA256(#344-#351)
		// sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd64};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		
		@(posedge clk)
		command_in = {10'd1004,10'd0,10'd344,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		
		@(posedge clk)
		command_in = {10'd1004,10'd0,10'd344,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		
		@(posedge clk)
		command_in = {10'd1004,10'd0,10'd344,5'd1};		
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		


		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		




		// verify;
		//verify_true = verify(c, cmp, SABER_BYTES_CCA_DEC); 
		// c is 136 words long and is from #200
		// cmp is 136 words long and is from #868
		@(posedge clk)
		command_in = {3'd0,16'd0,16'd136};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        
		
		@(posedge clk)
		command_in = {10'd0,10'd868,10'd200,5'd14};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        
		
		@(posedge clk)
		command_in = 35'd0;		
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        

		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        

        // cmov(kr, sk+SABER_SECRETKEYBYTES-SABER_KEYBYTES, SABER_KEYBYTES, fail); 
		@(posedge clk)
        command_in = {10'd1008,10'd1004,10'd124,5'd15};
        command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        

		@(posedge clk)
		command_in = 35'd0;
        command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
        $display("%h,", instruction);        

	end
   always #5 clk = ~clk;
      
endmodule

