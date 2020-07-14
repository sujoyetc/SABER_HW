module ins_ROM_old(clk, address, rom_data);
input clk;
input [5:0] address;
output reg [36:0] rom_data;

wire [37:0] rom_data_w;

// rom_data = {we1,we0,op3,op2,op1,INS}
assign rom_data_w = (address==6'd0) ? 37'd0 :
										(address==6'd1) ? {1'b0,1'b1,10'd0,10'd0,10'd0,5'd0} :
										(address==6'd2) ? {1'b1,1'b0,3'd0,16'd32,16'd32} :									
										(address==6'd3) ? {1'b0,1'b1,10'd124,10'd0,10'd124,5'd1} :	// INS1
										(address==6'd4) ? {1'b0,1'b1,10'd0,10'd0,10'd0,5'd0} :
										(address==6'd5) ? {1'b0,1'b1,10'd0,10'd0,10'd0,5'd31} :	
										37'd0;
									
always @(posedge clk)
	rom_data <= rom_data_w;
	
endmodule
	