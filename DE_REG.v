`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:19 11/19/2024 
// Design Name: 
// Module Name:    DE_REG 
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
module DE_REG(
    input wire [31:0] D_Instr,
	input wire [31:0] D_PC,
	input wire clk,
	input wire reset,//异步复位
	
	input wire D_jump,//是否跳转，针对跳转不链接类型
	output reg E_jump,
	
    input wire[31:0] D_rs,
    input wire[31:0] D_rt,
    input wire [31:0] D_extended,
	input wire en,//使能信号
    input wire clr,//清除信号
    input wire [2:0] D_Tnew,
	output reg [31:0] E_Instr,
	output reg [31:0] E_PC,
    output reg [31:0] E_rs,
	output reg [31:0] E_rt,
    output reg [31:0] E_extended,
    output reg [2:0] E_Tnew
    );

    initial begin
        
        E_Instr = 0;
        E_PC = 0;
        E_rs = 0;
        E_rt = 0;
        E_extended = 0; 
        E_Tnew = 0;
    end

    always @(posedge clk or posedge reset) begin
        if(reset || clr) begin
            E_Instr <= 0;
            E_PC <= 0;
            E_rs <= 0;
            E_rt <= 0;
            E_extended <= 0;
            E_Tnew <= 0;
        end else if(en) begin
            E_Instr <= D_Instr;
            E_PC <= D_PC;
            E_rs <= D_rs;
            E_rt <= D_rt;
            E_extended <= D_extended;
            E_Tnew <= (D_Tnew == 3'b000) ? 3'b000 : D_Tnew - 3'b001;
            E_jump <= D_jump;
        end
        // 如果 en 为低，保持原值不变
    end


endmodule
`default_nettype none