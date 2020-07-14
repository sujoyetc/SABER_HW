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

module verify(clk, rst, ilen,
			 rd_address, rd_base_sel, din,
			 verify_true,
			 done);

input clk, rst;
input [9:0] ilen;	// input length for comparison; output len for writing result

output reg [8:0] rd_address;
output rd_base_sel;
input [63:0] din;

output verify_true;
output done;


reg [63:0] acc, din0, din1;
reg base_sel, din0_en, din1_en, acc_en;
reg verify_true;
reg rd_base_sel, inc_rd_address;

reg [2:0] state, nextstate;
wire rd_address_last;



always @(posedge clk)
begin
	if(din0_en)
		din0 <= din;
	if(din1_en)
		din1 <= din;
end

always @(posedge clk)
begin
	if(rst)
		acc <= 64'b0;
	else if(acc_en)
		acc <= acc | (din0 ^ din1);
	else
		acc <= acc;
end

always @(posedge clk)
begin
		verify_true <= (acc==64'd0);
end

always @(posedge clk)
begin
	if(rst)	
		rd_address <= 9'd0;
	else if(inc_rd_address)
		rd_address <= rd_address + 1'b1;
	else
		rd_address <= rd_address;
end		

assign rd_address_last = (rd_address == ilen) ? 1'b1 : 1'b0;
		
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
	3'd0: begin
					base_sel<=0; din0_en<=0; din1_en<=0; acc_en<=0;
					rd_base_sel<=0; inc_rd_address<=0;
				end
	3'd1: begin	// address_base0
					base_sel<=0; din0_en<=0; din1_en<=0; acc_en<=0;
					rd_base_sel<=0; inc_rd_address<=0;
				end
	3'd2: begin	// din0<--din; address_base1
					base_sel<=0; din0_en<=1; din1_en<=0; acc_en<=0;
					rd_base_sel<=1; inc_rd_address<=1;
				end
	3'd3: begin	// din1<--din; address_base0
					base_sel<=0; din0_en<=0; din1_en<=1; acc_en<=0;
					rd_base_sel<=0; inc_rd_address<=0;
				end
	3'd4: begin	// acc<--result; address_base1
					base_sel<=0; din0_en<=1; din1_en<=0; acc_en<=1;
					rd_base_sel<=1; inc_rd_address<=1;
				end
	
	3'd7: begin
					base_sel<=0; din0_en<=0; din1_en<=0; acc_en<=0;
					rd_base_sel<=0; inc_rd_address<=0;
				end	
	default: begin
					base_sel<=0; din0_en<=0; din1_en<=0; acc_en<=0;
					rd_base_sel<=0; inc_rd_address<=0;
				end				
	endcase
end	
		
always @(state or rd_address_last)
begin
	case(state)
	3'd0: nextstate <= 3'd1;
	3'd1: nextstate <= 3'd2;
	3'd2: nextstate <= 3'd3;
	3'd3: nextstate <= 3'd4;	
	3'd4: begin
					if(rd_address_last)
						nextstate <=3'd7;
					else
						nextstate <= 3'd3;
				end
	3'd7: nextstate <= 3'd7;
	default: nextstate <= 3'd0;	
	endcase
end

assign done = (state==3'd7) ? 1'b1 : 1'b0;
		
endmodule
		