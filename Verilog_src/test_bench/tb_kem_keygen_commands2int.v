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

module tb_kem_keygen_commands2int;

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
		command_in = {10'd896,10'd0,10'd0,5'd3};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		

        
        // Call SHAKE to write 3744 bytes.
		@(posedge clk)
		command_in = {3'd0,16'd3744,16'd32};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd100,10'd0,10'd896,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd100,10'd0,10'd896,5'd3};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		//// Matrix [A] generated.
		
		//////////////////////// Transpose A //////////////////////
		
		// Copy A[0][1] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd152,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);            
			
		// Copy A[1][0] to A[0][1]
		@(posedge clk)
		command_in = {10'd152,10'd52,10'd256,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);	
	
		@(posedge clk);
     command_in = {10'd0,10'd0,10'd0,5'd0};
     command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// Copy #568 (old A[0][1]) to A[1][0]
		@(posedge clk)
		command_in = {10'd256,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
 		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);			
			
			
		// Copy A[0][2] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd204,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);	
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
			
		// Copy A[2][0] to A[0][2]
		@(posedge clk)
		command_in = {10'd204,10'd52,10'd412,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);  
	
		// Copy #568 (old A[0][2]) to A[2][0]
		@(posedge clk)
		command_in = {10'd412,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
 		
			
		// Copy A[1][2] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd360,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
			
		// Copy A[2][1] to A[1][2]
		@(posedge clk)
		command_in = {10'd360,10'd52,10'd464,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// Copy #568 (old A[1][2]) to A[2][1]
		@(posedge clk)
		command_in = {10'd464,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk);
    command_in = {10'd0,10'd0,10'd0,5'd0};
    command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		/////////////// End of Transposing //////////////////////
		
		

		//#900 <-- SHAKE(#0-#3).
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
		command_in = {10'd900,10'd0,10'd4,5'd3};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		// #900-#947 <--SAMPLING(#900-#...)
		@(posedge clk)
		command_in = {10'd900,10'd0,10'd900,5'd13};
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

		// #100 <-- A[row0]*[s]	where row0 starts from address 100
		@(posedge clk)
		command_in = {10'd100,10'd900,10'd100,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// #100+64 <-- A[row1]*[s]	where row1 starts from address 100+52*3=256
		@(posedge clk)
		command_in = {10'd164,10'd900,10'd256,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		// #100+64+64 <-- A[row2]*[s]	where row2 starts from address 100+52*6=412
		@(posedge clk)
		command_in = {10'd228,10'd900,10'd412,5'd6};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);

		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		


		// #776-#895 <--POLVEC2BS(#100-#291);
		@(posedge clk)
		command_in = {10'd776,10'd0,10'd100,5'd7};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		


        // hash_pk #772 - #775 <- sha3_256(pk);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd992};
		command_we0 = 0; command_we1 = 1;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_in = {10'd772,10'd0,10'd776,5'd0};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_in = {10'd772,10'd0,10'd776,5'd1};
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);
		
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		instruction = {command_we1,command_we0,command_in};
		$display("%h,", instruction);		
		
		/////// DONE ////////////////////////////////
		// Secret key is in #768-#947 
		// Public key is in #776-#900 (they overlap because pk is contained in sk) 
		

	end
   always #5 clk = ~clk;
      

      
endmodule

