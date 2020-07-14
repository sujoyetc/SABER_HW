`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:14 04/18/2019 
// Design Name: 
// Module Name:    s_mul 
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
module small_alu1(clk, Ri, s, a, result);
input clk;
input [12:0] Ri, a;
input [12:0] s;
output [12:0] result;

//wire [12:0] result = s[4] ? Ri - s[3:0] * a : Ri + s[3:0] * a;

//wire [15:0] mul_out;
//
//multiplier M1(a, s[3:0], mul_out);


// ax2 = {a[11:0], 1'b0};
//wire [12:0] ax3 = a + {a[11:0], 1'b0};
// ax4 = a[10:0], 00
//wire [12:0] ax5 = a + {a[10:0], 2'b0};
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
wire [12:0] mod_out;
wire [25:0] a_mul_s ;
dsp_mul mul(clk, a, b, a_mul_s);
mod7681 mod (a_mul_s, mod_out);
			

wire [13:0] result_temp = Ri + mod_out;

wire [13:0] sub = result_temp - 13'd7681;
assign result = (sub[13]) ? result_temp : sub;
//wire [12:0] result = (s_sign) ? (Ri - a_mul_s) : (Ri + a_mul_s);

endmodule
