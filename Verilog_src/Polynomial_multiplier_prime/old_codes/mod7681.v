`define p 13'd7681
`timescale 1ns / 1ps

/*================================================================================
This HDL-source code of the Ring-LWE Encryption Scheme is released under the 
MPL 1.1/GPL 2.0/LGPL 2.1 triple license.

------------------------------------------------------------------------------
Copyright (c) 2014, KU Leuven. All rights reserved.

The initial developer of this source code is Sujoy Sinha Roy, KU Leuven.
Contact Sujoy.SinhaRoy@esat.kuleuven.be for comments & questions.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright 
     notice, this list of conditions and the following disclaimer in 
     the documentation and/or other materials provided with the distribution.

  3. The names of the authors may not be used to endorse or promote products
     derived from this HDL-source code without specific prior written permission.

THIS HDL-SOURCE CODE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED 
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL KU LEUVEN OR 
ANY CONTRIBUTORS TO THIS HDL-SOURCE CODE BE LIABLE FOR ANY DIRECT, INDIRECT, 
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT 
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

================================================================================*/
/*
module mod7681(clk, A, B);
input clk;
input [25:0] A;
output reg [12:0] B;

wire [12:0] A1, A2;
wire [8:0] A11;
wire [3:0] A12, A112;
wire [4:0] A111;

assign A1 = A[25:13];
assign A2 = A[12:0];
assign A11 = A1[12:4];
assign A12 = A1[3:0];
assign A112 = A11[3:0];
assign A111 = A11[8:4];

wire [5:0] S1;
wire [15:0] S2;

assign S1 = A111 + A112 + A12;
assign S2 = {S1,9'd0} + A2;

wire [9:0] M1;
wire [13:0] M2;

assign M1 = A111 + A11;
assign M2 = A1 + M1;

wire [16:0] R_wire;
reg [16:0] R;

assign R_wire = S2 - M2;

always @(posedge clk)
R <= R_wire;

wire [12:0] w1;
wire [15:0] w5, w4, w3, w2;
assign w1 = `p + R[12:0];
assign w2 = R[15:0] - `p;
assign w3 = R[15:0] - {`p,1'b0};
assign w4 = R[15:0] - 15'd23043;
assign w5 = R[15:0] - {`p,2'b0};

wire [12:0] B_wire;

assign B_wire =   (R[16]==1'b1) ? w1[12:0]
				:(w5[15]==1'b0) ? w5[12:0]
				:(w4[15]==1'b0) ? w4[12:0]
				:(w3[15]==1'b0) ? w3[12:0]
				:(w2[15]==1'b0) ? w2[12:0]
				:R[12:0];	
				
always @(posedge clk)
B <= B_wire;
				
endmodule
*/




module mod7681(A, B);
input [25:0] A;
output [12:0] B;

wire [12:0] A1, A2;
wire [8:0] A11;
wire [3:0] A12, A112;
wire [4:0] A111;

assign A1 = A[25:13];
assign A2 = A[12:0];
assign A11 = A1[12:4];
assign A12 = A1[3:0];
assign A112 = A11[3:0];
assign A111 = A11[8:4];

wire [5:0] S1;
wire [15:0] S2;

assign S1 = A111 + A112 + A12;
assign S2 = {S1,9'd0} + A2;

wire [9:0] M1;
wire [13:0] M2;

assign M1 = A111 + A11;
assign M2 = A1 + M1;

wire [16:0] R;

assign R = S2 - M2;

wire [12:0] w1;
wire [15:0] w5, w4, w3, w2;
assign w1 = `p + R[12:0];
assign w2 = R[15:0] - `p;
assign w3 = R[15:0] - {`p,1'b0};
assign w4 = R[15:0] - 15'd23043;
assign w5 = R[15:0] - {`p,2'b0};

assign B =   (R[16]==1'b1) ? w1[12:0]
				:(w5[15]==1'b0) ? w5[12:0]
				:(w4[15]==1'b0) ? w4[12:0]
				:(w3[15]==1'b0) ? w3[12:0]
				:(w2[15]==1'b0) ? w2[12:0]
				:R[12:0];	
endmodule
