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
module poly_load_control_BRAM1(clk, rst, s_address, poly_load_delayed, poly_load_done);
input clk, rst;
output [7:0] s_address;
output reg poly_load_delayed;
output poly_load_done;

reg [5:0] poly_word_counter;

always @(posedge clk)
begin
	if (rst)
		poly_load_delayed <= 0;
	else
		poly_load_delayed <= poly_word_counter < 52;
end

assign s_address = poly_word_counter;
	
always @(posedge clk)
begin
	if (rst)
		poly_word_counter <= 6'd0;
	else if (poly_word_counter < 52)
		poly_word_counter <= poly_word_counter + 6'd1;
	else
		poly_word_counter <= poly_word_counter;
end

assign poly_load_done = poly_word_counter == 6'd51 ? 1'b1 : 1'b0;

endmodule