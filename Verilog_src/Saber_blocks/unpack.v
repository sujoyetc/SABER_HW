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


/*

	SABER_un_pack4bit(scale_ar, op);

	//addition of h1
	for(i=0;i<SABER_N;i++){
		v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (mod_p) ) >> (SABER_EP-1);
	}

	POL2MSG(v, message_dec);


*/

`define h2 10'd228

module unpack(clk, rst, read_base_sel, read_address, read_data,
									write_address, write_data, write_en,
									done);
input clk, rst;
output read_base_sel;	// used to select either vprime or message; 1-->message
output [8:0] read_address;
input [63:0] read_data;

output reg [8:0] write_address;
output [63:0] write_data;
output write_en;
output done;


reg read_base_sel, inc_v_address, v_buffer64_en;
reg op_buffer16_en, op_buffer64_en, m_buffer_en, inc_write_address;
reg [63:0] op_buffer, v_buffer, m_buffer;
reg [8:0] v_address;
reg [4:0] state, nextstate;

wire v_address_64, store_m, load_op;
wire [9:0] add0, add1, add2, add3;
wire [8:0] op_address;
wire message_load_needed;

always @(posedge clk)
begin
	if(op_buffer64_en)
		op_buffer <= read_data;
	else if(op_buffer16_en)
		op_buffer <= {16'd0, op_buffer[63:16]};
end
always @(posedge clk)
begin
	if(v_buffer64_en)
		v_buffer <= read_data;
end
always @(posedge clk)
begin
	if(m_buffer_en)
		m_buffer <= {add3[9],add2[9],add1[9],add0[9],m_buffer[63:4]};
end

always @(posedge clk)
begin
	if(rst)
		v_address <= 9'd0;
	else if(inc_v_address)
		v_address <= v_address + 1'b1;
end
assign v_address_64 = (v_address==9'd64);
assign op_address = {2'd0,v_address[8:2]};
assign read_address = (read_base_sel==1'b0) ? v_address : op_address;

always @(posedge clk)
begin
	if(rst)
		write_address <= 9'd0;
	else if(inc_write_address)
		write_address <= write_address + 1'b1;
end
assign write_data = m_buffer[63:0];
assign write_en = inc_write_address;
assign store_m = (v_address[3:0]==4'd0) ? 1'b1 : 1'b0;
assign load_op = (v_address[1:0]==2'd0) ? 1'b1 : 1'b0;


//v[i]= ( ( v[i] + h2 - (op[i]<<(SABER_EP-SABER_ET)) ) & (mod_p) ) >> (SABER_EP-1);
//SABER_EP-SABER_ET=6
assign add0 = v_buffer[09:00] + `h2 - {op_buffer[3:0],6'd0};
assign add1 = v_buffer[25:16] + `h2 - {op_buffer[7:4],6'd0};
assign add2 = v_buffer[41:32] + `h2 - {op_buffer[11:8],6'd0};
assign add3 = v_buffer[57:48] + `h2 - {op_buffer[15:12],6'd0};

always @(posedge clk)
begin
	if(rst)
		state <= 5'd0;
	else
		state <= nextstate;
end

always @(state)
begin
	case(state)
	5'd0: begin 
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0;
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=0;
		end

	5'd1: begin // Fetch op; 
			read_base_sel<=1; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=0;
		end
	5'd2: begin // write 64 bits of op; Fetch v;
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=0; op_buffer64_en<=1;
			m_buffer_en<=0; inc_write_address<=0;
		end	
	// State 3 and 4 happen in a loop.
	5'd3: begin // Write 4 coeff of v;  inc v_address
			read_base_sel<=0; inc_v_address<=1; v_buffer64_en<=1; 
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=0;
		end
	5'd4: begin // Compute 4 bits of m from 16 bits op and 40 bit v; 
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=1; op_buffer64_en<=0;
			m_buffer_en<=1; inc_write_address<=0;
		end
		
	5'd5: begin // Store 64 bits of m; 
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=1;
		end
		
	5'd15: begin  
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=0;
		end
	default: begin  
			read_base_sel<=0; inc_v_address<=0; v_buffer64_en<=0; 
			op_buffer16_en<=0; op_buffer64_en<=0;
			m_buffer_en<=0; inc_write_address<=0;
		end
	endcase
end
	
always @(state or store_m or load_op or v_address_64)
begin
	case(state)
	5'd0: nextstate <= 5'd1;
	5'd1: nextstate <= 5'd2;
	5'd2: nextstate <= 5'd3;
	
	5'd3: nextstate <= 5'd4;
	5'd4: begin
				if(store_m)
					nextstate <= 5'd5;
				else if(load_op)
					nextstate <= 5'd1;	
				else
					nextstate <= 5'd3;
			end
			
	5'd5: begin
				if(v_address_64)
					nextstate <= 5'd15;
				else	
					nextstate <= 5'd1;
			end
	5'd15: nextstate <= 5'd15;				
	default: nextstate <= 5'd0;	
	endcase
end
	
assign done = (state==5'd15) ? 1'b1 : 1'b0;	
endmodule
