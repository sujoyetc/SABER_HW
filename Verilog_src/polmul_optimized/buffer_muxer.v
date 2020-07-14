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

module buffer_muxer1(input0, input1, input2, input3,
					input4, input5, input6, input7,
					input8, input9, input10, input11,
					input12, input_ten_bit_0, selector, ten_bit_coeff, out);

input [12:0] input0, input1, input2, input3, input4, input5, input6, input7, 
			 input8, input9, input10, input11, input12, input_ten_bit_0;
input ten_bit_coeff;
input [3:0] selector;

output wire [12:0] out;


assign out = ten_bit_coeff ? selector == 0 ? input_ten_bit_0 : input12 :
				selector == 0 ? input0 :
				selector == 1 ? input1 :
				selector == 2 ? input2 :
				selector == 3 ? input3 :
				selector == 4 ? input4 :
				selector == 5 ? input5 :
				selector == 6 ? input6 :
				selector == 7 ? input7 :
				selector == 8 ? input8 :
				selector == 9 ? input9 :
				selector == 10 ? input10 :
				selector == 11 ? input11 :
				input12;
			
endmodule