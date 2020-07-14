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

module VectorMul(clk, rst, 
						rst_pol_mul, pol_acc_clear, pol_base_sel, 
						pol_mul_done, result_read,
						PolMem_address, PolMem_wen, done);
input clk, rst;
output reg rst_pol_mul, pol_acc_clear;
output reg [1:0] pol_base_sel;	// selects one of the three s polynomials

input pol_mul_done;
output reg result_read;
// Assumes the other operand polynomial comes from FIFO. 
// The fifo is accessed by pol_multiplier

output [5:0] PolMem_address;
output PolMem_wen;
output done;

reg [5:0] PolMem_address;
reg PolMem_wen;
reg [2:0] state, nextstate;
wire PolMem_write_complete;

always @(posedge clk)
begin
	if(rst)
		PolMem_address <= 6'd0;
	else if(PolMem_wen)
		PolMem_address <= PolMem_address + 1'b1;
	else
		PolMem_address <= PolMem_address;
end		

assign PolMem_write_complete = (PolMem_address==6'd63) ? 1'b1 : 1'b0;	
	
always @(posedge clk)
begin
	if(rst)
		state <= 3'd0;
	else
		state <= nextstate;
end
		
always @(state)
begin
	case(state)
	3'd0: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b1; pol_base_sel<=2'd0; result_read<=1'b0; PolMem_wen<=1'b0; end
	// acc<--a[0]*s[0]
	3'd1: begin rst_pol_mul<=1'b0; pol_acc_clear<=1'b0; pol_base_sel<=2'd0; result_read<=1'b0; PolMem_wen<=1'b0; end
	3'd2: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b0; pol_base_sel<=2'd1; result_read<=1'b0; PolMem_wen<=1'b0; end

	// acc<--acc+a[1]*s[1]
	3'd3: begin rst_pol_mul<=1'b0; pol_acc_clear<=1'b0; pol_base_sel<=2'd1; result_read<=1'b0; PolMem_wen<=1'b0; end
	3'd4: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b0; pol_base_sel<=2'd2; result_read<=1'b0; PolMem_wen<=1'b0; end

	// acc<--acc+a[2]*s[2]
	3'd5: begin rst_pol_mul<=1'b0; pol_acc_clear<=1'b0; pol_base_sel<=2'd2; result_read<=1'b0; PolMem_wen<=1'b0; end
	
	// Store acc[] in BRAM
	3'd6: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b0; pol_base_sel<=2'd2; result_read<=1'b1; PolMem_wen<=1'b1; end

	3'd7: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b1; pol_base_sel<=2'd2; result_read<=1'b0; PolMem_wen<=1'b0; end
	default: begin rst_pol_mul<=1'b1; pol_acc_clear<=1'b1; pol_base_sel<=2'd2; result_read<=1'b0; PolMem_wen<=1'b0; end
	endcase
end	

always @(state or pol_mul_done or PolMem_write_complete)
begin
	case(state)
	3'd0: nextstate<=3'd1;

	// acc <-- a[0]*s[0]
	3'd1: begin
				if(pol_mul_done)
					nextstate<=3'd2;
				else	
					nextstate<=3'd1;
			end		
	3'd2: nextstate<=3'd3;

	// acc <-- acc+a[1]*s[1]
	3'd3: begin
				if(pol_mul_done)
					nextstate<=3'd4;
				else	
					nextstate<=3'd3;
			end		
	3'd4: nextstate<=3'd5;

	// acc <-- acc+a[2]*s[2]
	3'd5: begin
				if(pol_mul_done)
					nextstate<=3'd6;
				else	
					nextstate<=3'd5;
			end		
	3'd6: begin
				if(PolMem_write_complete)
					nextstate<=3'd7;
				else
					nextstate<=3'd6;
			end		
	3'd7: nextstate<=3'd7;
	default: nextstate<=3'd0;
	endcase
end
	
assign done = (state==3'd7) ? 1'b1 : 1'b0;
	
endmodule
