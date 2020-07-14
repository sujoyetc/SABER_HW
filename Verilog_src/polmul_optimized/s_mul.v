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

module small_alu1(Ri, s, a, result);
input [12:0] Ri, a;
input [3:0] s;
output [12:0] result;

//wire [12:0] result = s[4] ? Ri - s[3:0] * a : Ri + s[3:0] * a;

//wire [15:0] mul_out;
//
//multiplier M1(a, s[3:0], mul_out);


// ax2 = {a[11:0], 1'b0};
wire [12:0] ax3 = a + {a[11:0], 1'b0};
// ax4 = a[10:0], 00
wire [12:0] ax5 = a + {a[10:0], 2'b0};
//wire [12:0] ax6 = {a[11:0], 1'b0} + {a[10:0], 2'b0}; // a*2 + a*4
//wire [12:0] ax7 = a + {a[11:0], 1'b0} + {a[10:0], 2'b0}; //a + a*2 + a*4. Is it better to do a*8 - a?
//// ax8 = a[9:0], 00
//wire [12:0] ax9 = a + {a[9:0], 3'b0}; // a + a*8
//wire [12:0] ax10 = {a[11:0], 1'b0} + {a[9:0], 3'b0}; // a*2 + a*8
//wire [12:0] ax11 = a + {a[11:0], 1'b0} + {a[9:0], 3'b0}; // a + a*2 + a*8
//wire [12:0] ax12 = {a[10:0], 2'b0} + {a[9:0], 3'b0}; // a*4 + a*8
//wire [12:0] ax13 = a + {a[10:0], 2'b0} + {a[9:0], 3'b0}; // a + a*4 + a*8
//wire [12:0] ax14 = {a[11:0], 1'b0} + {a[10:0], 2'b0} + {a[9:0], 3'b0}; // a*2 + a*4 + a*8
//wire [12:0] ax15 = a + {a[11:0], 1'b0} + {a[10:0], 2'b0} + {a[9:0], 3'b0}; // a + a*2 + a*4 + a*8


wire [12:0] a_mul_s = s[2:0] == 3'd0 ? 13'd0
					: s[2:0] == 3'd1 ? a
					: s[2:0] == 3'd2 ? {a[11:0],1'b0}
					: s[2:0] == 3'd3 ? ax3
					: s[2:0] == 3'd4 ? {a[10:0], 2'b0}
					: ax5;
//					: s[3:0] == 4'd5 ? ax5
//					: s[3:0] == 4'd6 ? ax6
//					: s[3:0] == 4'd7 ? ax7
//					: s[3:0] == 4'd8 ? {a[9:0], 3'b0}
//					: s[3:0] == 4'd9 ? ax9
//					: s[3:0] == 4'd10 ? ax10
//					: s[3:0] == 4'd11 ? ax11
//					: s[3:0] == 4'd12 ? ax12
//					: s[3:0] == 4'd13 ? ax13
//					: s[3:0] == 4'd14 ? ax14
//					: ax15;
					
					
wire [12:0] result = s[3] ? Ri - a_mul_s : Ri + a_mul_s;


//wire [12:0] result = s[4] ? Ri - mul_out[12:0] : Ri + mul_out[12:0];

//wire [12:0] result = (s_sign) ? (Ri - a_mul_s) : (Ri + a_mul_s);

endmodule
