`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:43 07/05/2019 
// Design Name: 
// Module Name:    poly_load_control_BRAM 
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
module poly_load_control_BRAM(clk, rst, pol_load_coeff4x,
						bram_address_relative, poly_load_delayed, poly_load_done);
input clk, rst;
input pol_load_coeff4x; // If 1 then input data contains 4 uint16_t coefficients
output [5:0] bram_address_relative;
output reg poly_load_delayed;
output poly_load_done;

reg [2:0] state, nextstate;
reg [5:0] poly_word_counter;
wire poly_word_counter_end;
reg poly_load;

always @(posedge clk)
	poly_load_delayed <= poly_load;

assign bram_address_relative = poly_word_counter;
	
always @(posedge clk)
begin
	if(rst)
		poly_word_counter<=6'd0;
	else if(poly_load)
		poly_word_counter<=poly_word_counter+1'b1;
	else
		poly_word_counter<=poly_word_counter;
end
assign poly_word_counter_end = (pol_load_coeff4x==1'b1 && poly_word_counter==6'd63) ? 1'b1 : (pol_load_coeff4x==1'b0 && poly_word_counter==6'd51) ? 1'b1 : 1'b0;
		
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
				poly_load<=1'b0;
			end
	3'd1: begin // Increment BRAM address and write poly 64 bits
				poly_load<=1'b1;
			end
	3'd2: begin
				poly_load<=1'b0;
			end
	3'd3: begin
				poly_load<=1'b0;
			end			
	default: begin
				poly_load<=1'b0;
			end
	endcase
end	

always @(state or poly_word_counter_end)
begin
	case(state)
	3'd0: nextstate <= 3'd1;
	3'd1: begin
				if(poly_word_counter_end)
					nextstate <= 3'd2;
				else
					nextstate <= 3'd1;
			end			
	3'd2: nextstate <= 3'd3;
	3'd3: nextstate <= 3'd3;
	default: nextstate <= 3'd0;
	endcase
end

wire poly_load_done = (state==3'd3) ? 1'b1 : 1'b0;
endmodule
