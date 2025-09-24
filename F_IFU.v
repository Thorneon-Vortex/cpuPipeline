`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:07 11/08/2024 
// Design Name: 
// Module Name:    ifu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Commennts: 
//
//////////////////////////////////////////////////////////////////////////////////
module F_IFU(
    input wire [31:0] A,
    input wire clk,
	 input wire reset,
	 input wire en,
    output wire [31:0] Instr,
    output reg [31:0] PC
    );

reg [31:0] R[0:4095];

	
	integer i;
	
	initial begin
		PC = 32'h00003000;
		for(i = 0;i < 4096;i = i + 1) R[i] = 0;
		$readmemh("code.txt", R);
	end
	
	always @ (posedge clk) begin
		if(reset) begin
			PC <= 32'h00003000;
		end else if(en) begin
			PC <= A;
			end
			//使能为0，则不进行指令的执行
	end

	wire [31:0] addr;
assign addr = (PC-32'h00003000)>>2;
assign Instr = R[addr];
//always @(*)begin
//if(A ==32'h00003044)$display("IFU's PC=%h,IFU's Instr=%h",PC,Instr);
//end
endmodule
`default_nettype none