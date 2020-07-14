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
module small_alu(Ri, a, s, s_sign, result);
input [12:0] Ri, a;
input [2:0] s;
input s_sign;
output [12:0] result;

wire [12:0] ax3 = a + {a[11:0],1'b0};

wire [12:0] a_mul_s = (s==3'd0) ? 13'd0
					:(s==3'd1) ? a
					:(s==3'd2) ? {a[11:0],1'b0}
					:(s==3'd3) ? ax3
					:{a[10:0],2'b00};
					
wire [12:0] result = (s_sign) ? (Ri - a_mul_s) : (Ri + a_mul_s);

endmodule


