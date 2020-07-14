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

	Constant time move depending on flag verify_true.

*/


module cmov(clk, rst, verify_true,
									rd_base_sel, read_address, read_data,
									write_address, write_data, write_en,
									done);
			
input clk, rst;
input verify_true;
output rd_base_sel;
output [8:0] read_address;
input [63:0] read_data;

output [8:0] write_address;
output [63:0] write_data;
output write_en;
output done;

assign rd_base_sel = verify_true;

copy_words	COPY(clk, rst, 9'd4, 
									read_address, read_data,
									write_address, write_data, write_en,
									done);

endmodule
