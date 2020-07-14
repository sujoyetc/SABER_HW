`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// High-speed instruction set coprocessor architecture for lattice-based cryptography. 
// Saber is implemented as a case study.
// The designers are Sujoy Sinha Roy and Andrea Basso. 

// Implementation by the designers, hereby denoted as "the implementer".

// To the extent possible under law, the implementer has waived all copyright
// and related or neighboring rights to the source code in this file.
// http://creativecommons.org/publicdomain/zero/1.0/

// The codes are for academic research use only and does not come with any support or any responsibility.

//////////////////////////////////////////////////////////////////////////////////

`define sha_constant576 8'h06
`define sha_constant1088 8'h06
`define sha_constant1344 8'h1F

`define rate_constant1344 8'd21
`define rate_constant1088 8'd17
`define rate_constant576 8'd9

module SHA_SHAKE_wrapper(clk, rst, shake_intermediate_rst, shake_next_extract, rate_type, mlen, 
									rd_address, din,
									olen, dout, wt_address, sample_dout, 
									done);

input clk, rst;
input shake_intermediate_rst, shake_next_extract;	
									//    SHAKE 1st--> shake_intermediate_rst-->shake_next_extract -->|
									//								^-----------------------------------------|

input [1:0] rate_type;		// 0->rate576, SHA512
							// 1->rate1088, SHA256
							// 2->rate1344, SHAKE128

input [31:0] mlen;			// message length in bytes

output reg [8:0] rd_address;
input [63:0] din;

input [31:0] olen;			// output length in bytes
output [63:0] dout;
output reg [8:0] wt_address;
output sample_dout;
output reg done;


reg [31:0] mlen_reg, olen_reg;
reg dec_mlen;
reg continue_permutation;
reg inc_rd_address;
 
reg [7:0] rate;
reg inc_rate;
reg [3:0] state, nextstate;
wire done_wire;

wire [7:0] rate_constant =  (rate_type==2'd0) ? `rate_constant576 : 
				  		    (rate_type==2'd1) ? `rate_constant1088 : `rate_constant1344;

wire [7:0] domain_separator =   (rate_type==2'd0) ? `sha_constant576 :
								(rate_type==2'd1) ? `sha_constant1088 : `sha_constant1344;

always @(posedge clk)
begin
	if(rst)
		mlen_reg <= mlen;
	else if(dec_mlen)
		mlen_reg <= mlen_reg - 32'd8;
	else
		mlen_reg <= mlen_reg;
end		

always @(posedge clk)
begin
	if(rst)
		olen_reg <= olen;
	else if(shake_intermediate_rst)
		olen_reg <= olen;
	else if(sample_dout)
		olen_reg <= olen_reg - 32'd8;
	else
		olen_reg <= olen_reg;
end

wire mlen_g8 = (mlen_reg > 32'd7) ? 1'b1 : 1'b0;
wire mlen_n0 = (mlen_reg != 32'd0) ? 1'b1 : 1'b0;
wire olen_is0 = (olen_reg==32'd0) ? 1'b1 : 1'b0;

reg domain_separator_used;

always @(posedge clk)
begin
	if(rst)
		domain_separator_used <= 1'b0;
	else if(domain_separator_used==1'b0 && mlen_g8==1'b0 && state==4'd1)
		domain_separator_used <= 1'b1;
	else
		domain_separator_used <= domain_separator_used;
end

wire rate_full = (rate==rate_constant) ? 1'b1 : 1'b0;
always @(posedge clk)
begin
	if(rst)
		rate <= 8'd1;
	else if(rate_full && inc_rate)
		rate <= 8'd1;
	else if(inc_rate)
		rate <= rate + 1'b1;
	else
		rate <= rate;
end

wire last_rate_byte = (mlen_g8==1'b0 && rate_full==1'b1) ? 1'b1 : 1'b0;		

wire [7:0] din0 = (mlen_g8) ? din[7:0] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd0) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd0) ? din[7:0] :	8'd0;					 
wire [7:0] din1 = (mlen_g8) ? din[15:8] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd1) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd1) ? din[15:8] :	8'd0;
wire [7:0] din2 = (mlen_g8) ? din[23:16] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd2) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd2) ? din[23:16] :	8'd0;
wire [7:0] din3 = (mlen_g8) ? din[31:24] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd3) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd3) ? din[31:24] :	8'd0;
wire [7:0] din4 = (mlen_g8) ? din[39:32] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd4) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd4) ? din[39:32] :	8'd0;						 
wire [7:0] din5 = (mlen_g8) ? din[47:40] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd5) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd5) ? din[47:40] :	8'd0;						
wire [7:0] din6 = (mlen_g8) ? din[55:48] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd6) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd6) ? din[55:48] :	8'd0;						 
wire [7:0] din7_temp = (mlen_g8) ? din[63:56] : 
						 (domain_separator_used==1'b0 && mlen_reg[2:0]==3'd7) ? domain_separator :
						 (domain_separator_used==1'b0 && mlen_reg[2:0]>3'd7) ? din[63:56] :	8'd0;
wire [7:0] din7 = (last_rate_byte) ? {1'b1,din7_temp[6:0]} : din7_temp;

// Keccak core inputs
reg start, rst_keccak;
wire [63:0] dina = {din7,din6,din5,din4,din3,din2,din1,din0};
reg din_valid;
reg last_block;

// Keccak core outputs
wire buffer_full, ready, dout_valid;
wire [63:0] dout;

keccak KECCAK(
			 clk, 
			 rst_keccak, 
			 start, 
			 continue_permutation,
			 rate_type,
			 dina,
			 din_valid,
			 buffer_full,
			 last_block,    
			 ready,    
			 dout,
			 dout_valid);

always @(posedge clk)
begin
	if(rst)
		rd_address <= 9'd0;
	else if(inc_rd_address)
		rd_address <= rd_address + 1'b1;
	else
		rd_address <= rd_address;
end		

always @(posedge clk)
begin
	if(rst)
		wt_address <= 9'd0;
	else if(sample_dout)
		wt_address <= wt_address + 1'b1;
	else
		wt_address <= wt_address;
end

always @(posedge clk)
begin
	if(rst)
		state <= 4'd0;
	else
		state <= nextstate;
end

always @(state or buffer_full or rate_full or mlen_g8)
begin
	case(state)
	4'd0: begin
			start<=1'b1; rst_keccak<=0; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	 
			dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end	

	4'd10: begin // increment BRAM read address
			start<=1'b1; rst_keccak<=0; inc_rd_address<=1; din_valid<=1'b0; last_block<=1'b0;	 
			dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end
	4'd1: begin
				start<=1'b0; rst_keccak<=1; /*inc_rd_address<=1;*/ din_valid<=1'b1; last_block<=1'b0;	 
				if(mlen_g8==1'b0 || rate_full==1'b1) dec_mlen<=0; else dec_mlen<=1; 
				if(rate_full) inc_rd_address<=0;  else inc_rd_address<=1;  				
				if(rate_full) inc_rate<=0; else inc_rate<=1;
				continue_permutation<=0;
			end
	/*		
	4'd2: begin
				start<=1'b0; rst_keccak<=1;  din_valid<=1'b0; last_block<=1'b0;	
				if(buffer_full==1'b1 || mlen_g8==1'b0) dec_mlen<=0; else dec_mlen<=1;
				if(buffer_full==1'b1 || mlen_g8==1'b0) inc_rd_address<=0; else inc_rd_address<=1;
				if(buffer_full==1'b1) inc_rate<=0; else inc_rate<=1;
				continue_permutation<=0;
			end
	*/
	4'd2: begin
                start<=1'b0; rst_keccak<=1;  din_valid<=1'b0; last_block<=1'b0;    
                dec_mlen<=0; inc_rd_address<=0; inc_rate<=0; continue_permutation<=0;
            end
	4'd13: begin
                start<=1'b0; rst_keccak<=1;  din_valid<=1'b0; last_block<=1'b0;    
                if(mlen_g8==1'b0) dec_mlen<=0; else dec_mlen<=1;
                if(mlen_g8==1'b0) inc_rd_address<=0; else inc_rd_address<=1;
                inc_rate<=1; continue_permutation<=0;
            end
				
	4'd3: begin
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b1;	
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end
	
	// This state sends output
	4'd6: begin
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end
	4'd7: begin
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end
			
	4'd8: begin
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	 
				dec_mlen<=0; inc_rate<=0; continue_permutation<=1;
			end
	4'd9: begin
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end		

	4'd14: begin	// End state
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	 
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end	

	4'd15: begin	// End state
				start<=1'b0; rst_keccak<=1; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	 
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end	
			
	default: begin
				start<=1'b1; rst_keccak<=0; inc_rd_address<=0; din_valid<=1'b0; last_block<=1'b0;	
				dec_mlen<=0; inc_rate<=0; continue_permutation<=0;
			end	
			
	endcase
end


always @(state or buffer_full or last_rate_byte or sample_dout or olen_is0 
			or shake_intermediate_rst or shake_next_extract)
begin
	case(state)
	4'd0: nextstate <= 4'd10;
	4'd10: nextstate <= 4'd1;
	4'd1: begin
				if(buffer_full)
					nextstate <= 4'd2;
				else
					nextstate <= 4'd1;
			end
    /*
	4'd2: begin
				if(last_rate_byte)
					nextstate <= 4'd3;
				else if(buffer_full)
					nextstate <= 4'd2;
				else
					nextstate <= 4'd1;
			end
	*/		
	4'd2: begin
                if(last_rate_byte)
                    nextstate <= 4'd3;
                else if(buffer_full)
                    nextstate <= 4'd2;
                else
                    nextstate <= 4'd13;
            end
	4'd13: nextstate <= 4'd1;
		
	4'd3: begin
				if(sample_dout)
					nextstate <= 4'd6;
				else	
					nextstate <= 4'd3;
			end
	4'd6: begin
				if(sample_dout)
					nextstate <= 4'd6;
				else	
					nextstate <= 4'd7;
			end
	4'd7: begin
				if(olen_is0)
					nextstate <= 4'd15;
				else
					nextstate <= 4'd8;
			end			
	4'd8: nextstate <= 4'd9;				
	4'd9: nextstate <= 4'd3;					

	4'd15: begin
				if(shake_intermediate_rst)
					nextstate <= 4'd14;
				else		
					nextstate <= 4'd15;
			end		
	4'd14: begin
				if(shake_next_extract)
					nextstate <= 4'd8;
				else		
					nextstate <= 4'd14;
			end			
	default: nextstate <= 4'd0;
	endcase
end

assign sample_dout = dout_valid & ready & (!olen_is0);

assign done_wire = (state==4'd15) ? 1'b1 : 1'b0;
always @(posedge clk)
    done <= done_wire;
    	
endmodule
