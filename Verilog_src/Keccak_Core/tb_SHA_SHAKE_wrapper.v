`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:21 07/13/2019
// Design Name:   SHA_SHAKE_wrapper_test
// Module Name:   /home/sujoy/Downloads/Saber_multiplication/SHA_256_512_SHAKE128_high_speed/Keccak_high_speed/tb_wrapper.v
// Project Name:  Keccak_high_speed
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SHA_SHAKE_wrapper_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sha_shake_wrapper;

	// Inputs
	reg clk;
	reg [8:0] address_ext;
	reg [63:0] dina_ext;
	reg wea_ext;
	reg [31:0] command_in;
	reg command_we0, command_we1, command_enable;

	// Outputs
	wire done_shake;

	// Instantiate the Unit Under Test (UUT)
	SHA_SHAKE_wrapper_test uut (
		.clk(clk), 
		.address_ext(address_ext), 
		.dina_ext(dina_ext), 
		.wea_ext(wea_ext), 
		.command_in(command_in), 
		.command_we0(command_we0),
		.command_we1(command_we1),	
		.command_enable(command_enable),
		.done_shake(done_shake)
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
		command_enable = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clk)
		command_in = 32'd0;
		command_we0 = 1; command_we1 = 0;
		command_enable = 0;

		@(posedge clk);
		address_ext = 9'd0; dina_ext = 64'h38520EBAD808EE98; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd1; dina_ext = 64'h15A05FE0A84F7D23; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd2; dina_ext = 64'hE8528969C871AABA; wea_ext = 1;
		@(posedge clk);
		address_ext = 9'd3; dina_ext = 64'h430DD8BC41420304; wea_ext = 1;
		@(posedge clk);
		wea_ext = 0;
		

		@(posedge clk)
		//command_in = {16'd32,16'd32};
		command_in = {16'd336,16'd32};
		command_we0 = 0; command_we1 = 1;
		command_enable = 0;
		@(posedge clk)
		command_in = {9'd16,9'd0,9'd0,5'd0};
		command_we0 = 1; command_we1 = 0;
		command_enable = 0;
		@(posedge clk)
		command_in = {9'd16,9'd0,9'd0,5'd0};
		command_we0 = 0; command_we1 = 0;
		command_enable = 1;

		@(posedge clk)
		command_in = {9'd16,9'd0,9'd0,5'd3};
		command_we0 = 1; command_we1 = 0;
		command_enable = 0;
		@(posedge clk)
		command_in = 32'd0;
		command_we0 = 0; command_we1 = 0;
		command_enable = 1;

		wait(done_shake);
			@(posedge clk);
			
		@(posedge clk)
		command_in = {9'd16,9'd0,9'd0,5'd4};
		command_we0 = 1; command_we1 = 0;
		command_enable = 0;
		@(posedge clk)
		command_in = 32'd0;
		command_we0 = 0; command_we1 = 0;
		command_enable = 1;

		@(posedge clk)
		command_in = {9'd16,9'd0,9'd0,5'd5};
		command_we0 = 1; command_we1 = 0;
		command_enable = 0;
		@(posedge clk)
		command_in = 32'd0;
		command_we0 = 0; command_we1 = 0;
		command_enable = 1;		
	end
   always #5 clk = ~clk;
   
endmodule

