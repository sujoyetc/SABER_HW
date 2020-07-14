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
		//message[i] = (message[i]<<9);
		message[i] = (message[i]<<(SABER_EP-1));		
	}

	for(k=0;k<SABER_N;k++)
	{
		vprime[k]=( (vprime[k] - message[k]) & (mod_p) )>>(SABER_EP-SABER_ET);
	}
	
	SABER_pack_4bit(msk_c, vprime);
*/

`define h1 10'd4

module Add_m_pack(clk, rst, read_base_sel, read_address, read_data,
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

reg inc_write_address, inc_vprime_address, buffer16_en, buffer64_en;

reg [8:0] vprime_address;
reg [63:0] message_buffer;
reg load_message, read_base_sel;
wire [1:0] message_address = vprime_address[5:4];
wire message_load_needed = (vprime_address[3:0]==4'd0) ? 1'b1 : 1'b0;

assign read_address = (read_base_sel==1'b0) ? vprime_address : {7'd0, message_address};

always @(posedge clk)
begin
	if(load_message)
		message_buffer <= read_data;
	else if(buffer16_en)
		message_buffer <= {4'd0, message_buffer[63:4]};
	else	
		message_buffer <= message_buffer;
end		

//vprime[k] + h1 - (message[i]<<9)		
wire [9:0] add0 = read_data[9:0] + `h1 - {message_buffer[0],9'd0};
wire [9:0] add1 = read_data[25:16] + `h1 - {message_buffer[1],9'd0};
wire [9:0] add2 = read_data[41:32] + `h1 - {message_buffer[2],9'd0};
wire [9:0] add3 = read_data[57:48] + `h1 - {message_buffer[3],9'd0};

// add >> 6
wire [15:0] round_p_value = {add3[9:6], add2[9:6], add1[9:6], add0[9:6]};

reg [63:0] buffer;

always @(posedge clk)
begin
	if(buffer16_en)
		buffer <= {round_p_value, buffer[63:16]};
end

assign write_data = buffer[63:0];
assign write_en = inc_write_address;

always @(posedge clk)
begin
	if(rst)
		vprime_address <= 9'd0;
	else if(inc_vprime_address)
		vprime_address <= vprime_address + 1'b1;
end
wire vprime_address_64 = (vprime_address==9'd64);

always @(posedge clk)
begin
	if(rst)
		write_address <= 9'd0;
	else if(inc_write_address)
		write_address <= write_address + 1'b1;
end

reg [4:0] state, nextstate;

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
	5'd0: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=0; end

	// Set message address for BRAM
	5'd16: begin read_base_sel<=1; load_message<=0; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=0; end
	// Store message 64 bits in message_buffer
	5'd17: begin read_base_sel<=0; load_message<=1; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=0; end
	
	// Read four 10 bit coeff, add h1, subtract m, take top 4 bits, write 16 bit in buffer; fill buffer
	5'd1: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=1; buffer16_en<=0; inc_write_address<=0; end
	5'd2: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=1; buffer16_en<=1; inc_write_address<=0; end
	5'd3: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=1; buffer16_en<=1; inc_write_address<=0; end
	5'd4: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=1; buffer16_en<=1; inc_write_address<=0; end
	5'd5: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=0; buffer16_en<=1; inc_write_address<=0; end
	
	// Read 64 bit chunks from buffer and write it
	5'd10: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=1; end	

	5'd15: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=0; end		
	default: begin read_base_sel<=0; load_message<=0; inc_vprime_address<=0; buffer16_en<=0; inc_write_address<=0; end		
	endcase
end

always @(state or vprime_address_64 or message_load_needed)
begin
	case(state)
	5'd0: nextstate <= 5'd16;

	5'd16: nextstate <= 5'd17;
	5'd17: nextstate <= 5'd1;
	
	5'd1: nextstate <= 5'd2;
	5'd2: nextstate <= 5'd3;
	5'd3: nextstate <= 5'd4;
	5'd4: nextstate <= 5'd5;
	5'd5: nextstate <= 5'd10;

	5'd10: begin
				if(vprime_address_64)
					nextstate <= 5'd15;
				else if(message_load_needed)
					nextstate <= 5'd16;
				else
					nextstate <= 5'd1;
			end			
	5'd15: nextstate <= 5'd15;
	default: nextstate <= 5'd0;
	endcase
end

assign done = (state==5'd15);
	
endmodule
