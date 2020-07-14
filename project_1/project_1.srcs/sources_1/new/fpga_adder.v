`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2018 09:42:28 AM
// Design Name: 
// Module Name: fpga_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module fpga_adder(clk, control_low_word, control_high_word, 
                    dina_ext_low_word, dina_ext_high_word, 
                    dout_ext_low_word, dout_ext_high_word, 
                    status);
input clk;
input [31:0] control_low_word, control_high_word;
input [31:0] dina_ext_low_word, dina_ext_high_word;

output [31:0] dout_ext_low_word, dout_ext_high_word;
output [31:0] status;

wire [63:0] control = {control_high_word,control_low_word};
wire [63:0] dina_ext = {dina_ext_high_word,dina_ext_low_word};
wire [63:0] dout_ext;
wire [31:0] status;


wire [9:0] address_ext;
wire wea_ext;

wire [34:0] command_in;
wire command_we0, command_we1;
wire done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler;

assign address_ext = control[9:0];
assign wea_ext = control[10];
assign command_in = control[45:11];
assign command_we0 = control[46];
assign command_we1 = control[47];

assign {done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler} = 8'b11111111;
assign status = {24'd0, done_shake, done_vmul, done_addround, done_addpack, done_bs2polvecp, done_unpack, done_copy, done_sampler};

wire wea = wea_ext;
wire [9:0] addra = address_ext;
wire [9:0] addrb = address_ext;
wire [63:0] dina = dina_ext;
wire [63:0] doutb;

assign {dout_ext_high_word, dout_ext_low_word} = doutb;
   
   
BRAM64_1024 BR (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [9 : 0] addra
  .dina(dina), // input [63 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrb), // input [9 : 0] addrb
  .doutb(doutb) // output [63 : 0] doutb
);

endmodule
