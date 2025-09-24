`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:07 11/20/2024 
// Design Name: 
// Module Name:    EM_REG 
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
module EM_REG(
    input wire clk,
    input wire reset,
	 
	 input wire E_jump,
	 output reg M_jump,
	 
    input wire [31:0] E_Instr,
    input wire [31:0] E_PC,
    input wire [31:0] E_ALUResult,
	 input wire [31:0] E_HILOResult,//乘除结果
	 
    input wire [31:0] E_rt,//sw写入的数据
    input wire en,
    input wire [2:0] E_Tnew,
    output reg [31:0] M_rt,
    output reg [31:0] M_PC,
    output reg [31:0] M_Instr,
    output reg [31:0] M_ALUResult,
    output reg [2:0] M_Tnew,
    output reg [31:0] M_HILOResult
    );

initial begin

    M_rt = 0;
    M_PC = 0;
    M_Instr = 0;
    M_ALUResult = 0;
    M_Tnew = 0;
end


always @(posedge clk or posedge reset) begin

    if(reset) begin
        M_rt <= 0;
        M_PC <= 0;
        M_Instr <= 0;
        M_ALUResult <= 0;
        M_Tnew <= 0;
    end
    else if(en) begin
        M_rt <= E_rt;
        M_PC <= E_PC;
        M_Instr <= E_Instr;
        M_ALUResult <= E_ALUResult;
        M_Tnew <= (E_Tnew == 3'b000)? 3'b000 : E_Tnew - 3'b001;
        M_jump <= E_jump;
		  M_HILOResult <= E_HILOResult;
    end
    //如果en为0，则保持原值不变
end

endmodule
`default_nettype none