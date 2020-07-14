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


module poly_load_control_BRAM1(clk, rst, s_address, poly_load_delayed, poly_load_done);
input clk, rst;
output [7:0] s_address;
output reg poly_load_delayed;
output poly_load_done;

reg [4:0] poly_word_counter;

always @(posedge clk)
begin
	if (rst)
		poly_load_delayed <= 0;
	else
		poly_load_delayed <= poly_word_counter < 16;
end

assign s_address = poly_word_counter;
	
always @(posedge clk)
begin
	if (rst)
		poly_word_counter <= 5'd0;
	else if (poly_word_counter < 16)
		poly_word_counter <= poly_word_counter + 5'd1;
	else
		poly_word_counter <= poly_word_counter;
end

assign poly_load_done = poly_word_counter == 5'd15 ? 1'b1 : 1'b0;

endmodule