`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:11 07/13/2019 
// Design Name: 
// Module Name:    cmov 
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


module timer_loop(clk, rst,  
									read_address, read_data,
									done);
input clk, rst;
output [8:0] read_address;
input [63:0] read_data;

output done;

reg [63:0] read_data_reg;
reg [32:0] counter;
reg inc, rd_load;
reg [2:0] state, nextstate;
wire counter_end;

assign read_address = 9'd0;

always @(posedge clk)
begin
	if(rd_load)
		read_data_reg <= read_data;
	else
		read_data_reg <= read_data_reg;
end		

always @(posedge clk)
begin
	if(rst)
		counter <= 40'd0;
	else if(inc)
		counter <= counter + 1'b1;
	else
		counter <= counter;
end

assign counter_end = (counter==read_data_reg[32:0]) ? 1'b1 : 1'b0;
		
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
	3'd0: begin rd_load<=0; inc<=0; end 
	// Set read address
	3'd1: begin rd_load<=0; inc<=0; end 
	// Load read data
	3'd2: begin rd_load<=1; inc<=0; end 
	3'd3: begin rd_load<=0; inc<=0; end 
	// Increment counter;
	3'd4: begin rd_load<=0; inc<=1; end 

	3'd7: begin rd_load<=0; inc<=0; end 	
	default: begin rd_load<=0; inc<=0; end 	
	endcase
end		

always @(state or counter_end)
begin
	case(state)
	3'd0: nextstate <= 3'd1;
	3'd1: nextstate <= 3'd2;
	3'd2: nextstate <= 3'd3;	
	3'd3: nextstate <= 3'd4;	

	3'd4: begin
					if(counter_end)
						nextstate <= 3'd7;
					else
						nextstate <= 3'd4;
				end
	3'd7: nextstate <= 3'd7;
	default: nextstate <= 3'd0;	
	endcase
end

assign done = (state==3'd7) ? 1'b1 : 1'b0;


endmodule
