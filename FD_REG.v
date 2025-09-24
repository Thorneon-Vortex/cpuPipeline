`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:37 11/19/2024 
// Design Name: 
// Module Name:    FD_REG 
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
module FD_REG(
	input wire [31:0] F_Instr,
	input wire [31:0] F_PC,
	input wire clk,
	input wire reset,//异步复位
	input wire en,//使能信号
	output reg [31:0] D_Instr,
	output reg [31:0] D_PC
    );
	 
	 initial begin
		D_Instr = 0;
		D_PC = 0;
	end
	
	always @(posedge clk or posedge reset) begin
        if (reset) begin
            D_Instr <= 0;
			D_PC <= 0;   // 异步复位：清零寄存器
        end else if (en) begin
		  D_Instr <= F_Instr;     // 当使能信号为高时更新寄存器
			D_PC <= F_PC;
        end
        // 如果 en 为低，保持 值不变
    end


endmodule
`default_nettype none