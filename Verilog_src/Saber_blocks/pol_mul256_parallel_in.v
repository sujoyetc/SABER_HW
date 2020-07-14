`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:37 04/18/2019 
// Design Name: 
// Module Name:    poly_mul256 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module poly_mul256_parallel_in(clk, rst, acc_clear, pol_load_coeff4x,
								bram_address_relative, pol_64bit_in,  
								s_address, s, s_sign, 
								read, coeff4x_out, 
								read64, polmul_result64_out, pol_mul_done);
								
input clk, rst;
input pol_load_coeff4x; // If 1 then input data contains 4 uint16_t coefficients
input acc_clear; // clears accumulator register
output [5:0] bram_address_relative;
input [63:0] pol_64bit_in;								
output reg [7:0] s_address;	// Assumes s is in BRAM. There is 1 cycle delay between address and data. 
input [2:0] s;
input s_sign;
input read, read64;

output [63:0] coeff4x_out;	// 4 coefficients, each as uint16_t
output [63:0] polmul_result64_out;
output pol_mul_done;

reg rst_poly_load;
wire poly_load, poly_load_done;

reg shift_pol, acc_en, s_address_inc;
reg [2:0] state, nextstate;
reg [8:0] counter;
wire counter_finish;

poly_load_control_BRAM PLC(clk, rst_poly_load, pol_load_coeff4x, bram_address_relative, poly_load, poly_load_done);


reg [3327:0]pol;
reg [3327:0] acc;
wire [3327:0] result;

parallel_Mults PMULTs(acc, pol, s, s_sign, result);

always @(posedge clk)
begin
	if(pol_load_coeff4x==1'b1 && poly_load==1'b1)
		pol <= {3'd0,pol_64bit_in[57:48],3'd0,pol_64bit_in[41:32],3'd0,pol_64bit_in[25:16],3'd0,pol_64bit_in[9:0],pol[3327:52]};
	else if(poly_load)
		pol <= {pol_64bit_in, pol[3327:64]};
	else if(shift_pol)
	begin
		pol <= {pol[3314:0],-pol[3327:3315]};
	end
end


always @(posedge clk)
begin
	if(acc_clear)
	begin
		acc <= 3328'd0;
	end
	else if(acc_en)	
	begin
		acc <= result;
	end
	else if(read)
	begin
		acc <= {acc[51:0],acc[3327:52]};
	end
	else if(read64)
	begin
		acc <= {acc[63:0],acc[3327:64]};
	end
end	

assign coeff4x_out = {3'd0,acc[51:39],3'd0,acc[38:26],3'd0,acc[25:13],3'd0,acc[12:0]};
assign polmul_result64_out = acc[63:0];

always @(posedge clk)
begin
	if(rst)
		s_address <= 8'd0;
	else if(s_address_inc)
		s_address <= s_address + 1'b1;
	else
		s_address <= s_address;
end
		
		

always @(posedge clk)
begin
	if(rst)
		state <= 3'd0;
	else 
		state <= nextstate;
end

always @(posedge clk)
begin
	if(rst)
		counter <= 9'd0;
	else if(state==9'd1)
		counter <= counter + 1'b1;
	else
		counter <= counter;
end

assign counter_finish = (counter == 9'd255) ? 1'b1 : 1'b0;		

always @(state)
begin
	case(state)
	3'd0: begin
				shift_pol<=1'b0; acc_en<=1'b0; s_address_inc<=1'b0; rst_poly_load<=1'b1;
			end
	3'd4: begin // load the polynomial
				shift_pol<=1'b0; acc_en<=1'b0; s_address_inc<=1'b0; rst_poly_load<=1'b0;
			end
	3'd3: begin	// Just increment the address of s for next data	
				shift_pol<=1'b0; acc_en<=1'b0; s_address_inc<=1'b1; rst_poly_load<=1'b1; 
			end			
	3'd1: begin
				shift_pol<=1'b1; acc_en<=1'b1; s_address_inc<=1'b1; rst_poly_load<=1'b1;
			end
	3'd2: begin
				shift_pol<=1'b0; acc_en<=1'b0; s_address_inc<=1'b0; rst_poly_load<=1'b1;
			end			
	default: begin
				shift_pol<=1'b0; acc_en<=1'b0; s_address_inc<=1'b0; rst_poly_load<=1'b1;
			end			
	endcase
end	

always @(state or counter_finish or poly_load_done)
begin
	case(state)
	3'd0: nextstate <= 3'd4;
	3'd4: begin
				if(poly_load_done)
					nextstate <= 3'd3;
				else
					nextstate <= 3'd4;
			end
	3'd3: nextstate <= 3'd1;
	3'd1: begin
				if(counter_finish)
					nextstate <= 3'd2;
				else
					nextstate <= 3'd1;
			end
	3'd2: nextstate <= 3'd2;
	default: nextstate <= 3'd0;
	endcase
end

wire pol_mul_done = (state==3'd2) ? 1'b1 : 1'b0;
	
endmodule
