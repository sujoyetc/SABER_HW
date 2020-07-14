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

module tb_kem_keygen;

	// Inputs
	reg clk;
	reg rst;
    reg [1:0] saber_type;
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
	reg [63:0] random_seed[3:0];
	reg [63:0] random_noiseseed[3:0];
	reg [63:0] pseudo_random[3:0];
	reg [9:0] i;
	
	// Instantiate the Unit Under Test (UUT)
	ComputeCore3 uut (
		.clk(clk), 
		.rst(rst),
       // .saber_type(saber_type),
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
		rst = 1;
        saber_type = 2'd2;  // For SABER (module dimension=3)
		address_ext = 0;
		dina_ext = 0;
		wea_ext = 0;
		command_in = 0;
		command_we0 = 0;
		command_we1 = 0;
	
		random_seed[0] = 64'h5e8c154d23501506;
        random_seed[1] = 64'h257aef04fe9555c9;
        random_seed[2] = 64'h79c42bcc242e7f76;
        random_seed[3] = 64'he7fdbc9adc869dd0;
        
        random_noiseseed[0] = 64'hff6da38dbcbc9f1a;
        random_noiseseed[1] = 64'hdb0f17963220be2a;
        random_noiseseed[2] = 64'h79b6fc677f29c397;
        random_noiseseed[3] = 64'hb05302d09f9c71ac;
        
        pseudo_random[0] = 64'hc4105f43f504f0b2;
		pseudo_random[1] = 64'h9bfd7a44481145cd;
		pseudo_random[2] = 64'h3ad0e00d7709b299;
		pseudo_random[3] = 64'h8c6871e56bbcb7cd;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;        
		// Add stimulus here
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// Load random_seed[] in #0-#3 
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i; dina_ext = random_seed[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;

		// Load random_noiseseed[] in #4-#7 
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+4; dina_ext = random_noiseseed[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;
		
		// Load pseudo_random[] in #768-#771  (part of sk_CCA)
		for(i=0; i<4; i=i+1)
		begin
			@(posedge clk);
			address_ext = i+768; dina_ext = pseudo_random[i]; wea_ext = 1;
			$display("i=%d din=%h\n", i, dina_ext);
		end
		@(posedge clk);
		address_ext = 0; dina_ext = 0; wea_ext = 0;
		
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd896,10'd0,10'd0,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		
		

        
        // Call SHAKE to write 3744 bytes.
		@(posedge clk)
		command_in = {3'd0,16'd3744,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd100,10'd0,10'd896,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd100,10'd0,10'd896,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		//// Matrix [A] generated.
		
		//////////////////////// Transpose A //////////////////////
		
		// Copy A[0][1] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd152,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
            
			
		// Copy A[1][0] to A[0][1]
		@(posedge clk)
		command_in = {10'd152,10'd52,10'd256,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
		
		// Copy #568 (old A[0][1]) to A[1][0]
		@(posedge clk)
		command_in = {10'd256,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
			
			
			
		// Copy A[0][2] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd204,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
			
		// Copy A[2][0] to A[0][2]
		@(posedge clk)
		command_in = {10'd204,10'd52,10'd412,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
		
		// Copy #568 (old A[0][2]) to A[2][0]
		@(posedge clk)
		command_in = {10'd412,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
			
			
			
		// Copy A[1][2] to #568, after A
		@(posedge clk)
		command_in = {10'd568,10'd52,10'd360,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
			
		// Copy A[2][1] to A[1][2]
		@(posedge clk)
		command_in = {10'd360,10'd52,10'd464,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
        	wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
		
		// Copy #568 (old A[1][2]) to A[2][1]
		@(posedge clk)
		command_in = {10'd464,10'd52,10'd568,5'd12};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;
		  wait(done_copy);
		@(posedge clk);
        command_in = {10'd0,10'd0,10'd0,5'd0};
        command_we0 = 1; command_we1 = 0;
        @(posedge clk);
            wait(!done_copy);
        @(posedge clk);
		
		/////////////// End of Transposing //////////////////////
		
		

		//#900 <-- SHAKE(#0-#3).
		@(posedge clk)
		command_in = {3'd0,16'd768,16'd32};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd900,10'd0,10'd4,5'd3};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;


		// #900-#947 <--SAMPLING(#900-#...)
		@(posedge clk)
		command_in = {10'd900,10'd0,10'd900,5'd13};
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

		// #100 <-- A[row0]*[s]	where row0 starts from address 100
		@(posedge clk)
		command_in = {10'd100,10'd900,10'd100,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);
		
		// #100+64 <-- A[row1]*[s]	where row1 starts from address 100+52*3=256
		@(posedge clk)
		command_in = {10'd164,10'd900,10'd256,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);

		// #100+64+64 <-- A[row2]*[s]	where row2 starts from address 100+52*6=412
		@(posedge clk)
		command_in = {10'd228,10'd900,10'd412,5'd6};
		command_we0 = 1; command_we1 = 0;
		wait(done_vmul);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_vmul);
		@(posedge clk);


		// #776-#895 <--POLVEC2BS(#100-#291);
		@(posedge clk)
		command_in = {10'd776,10'd0,10'd100,5'd7};
		command_we0 = 1; command_we1 = 0;
		wait(done_addround);
			@(posedge clk);
		@(posedge clk)
		command_in = {10'd0,10'd0,10'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk);
		wait(!done_addround);
		@(posedge clk);


        // hash_pk #772 - #775 <- sha3_256(pk);
		@(posedge clk)
		command_in = {3'd0,16'd32,16'd992};
		command_we0 = 0; command_we1 = 1;
		@(posedge clk)
		command_in = {10'd772,10'd0,10'd776,5'd0};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_in = {10'd772,10'd0,10'd776,5'd1};
		command_we0 = 1; command_we1 = 0;
		@(posedge clk)
		command_we0 = 0; command_we1 = 0;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = 35'd0;
		command_we0 = 1; command_we1 = 0;
		
		
		/////// DONE ////////////////////////////////
		// Secret key is in #768-#947 
		// Public key is in #776-#899 (they overlap because pk is contained in sk) 
		

	end
   always #5 clk = ~clk;
      
endmodule

