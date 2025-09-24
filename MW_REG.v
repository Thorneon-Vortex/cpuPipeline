`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:23 11/20/2024 
// Design Name: 
// Module Name:    MW_REG 
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
module MW_REG(
	input wire clk,
    input wire reset,//异步复位
    input wire en,//使能信号
	 input wire M_jump,
	 output reg W_jump,
    input wire [31:0] M_Instr,
    input wire [31:0] M_PC,
    input wire [31:0] M_ALUResult,
	 input wire [31:0] M_HILOResult,
	 
	 
    input wire [31:0] M_RD,
    input wire [2:0] M_Tnew,
    output reg [31:0] W_Instr,
    output reg [31:0] W_PC,
    output reg [31:0] W_RD,
    output reg [31:0] W_ALUResult,
	 output reg [31:0] W_HILOResult,
	 
    output reg [2:0] W_Tnew
    );

initial begin

    W_Instr = 0;
    W_PC = 0;
    W_RD = 0;
    W_ALUResult = 0;

end

always @(posedge clk or posedge reset) begin

    if(reset) begin
        W_Instr <= 0;
        W_PC <= 0;
        W_RD <= 0;
        W_ALUResult <= 0;   
        W_Tnew <= 0;
    end else if(en) begin
        W_Instr <= M_Instr;
        W_PC <= M_PC;
        W_RD <= M_RD;
        W_ALUResult <= M_ALUResult;
        W_Tnew <= (M_Tnew == 3'b000) ? 3'b000 : M_Tnew - 1;
        W_jump <= M_jump;
		  W_HILOResult <= M_HILOResult;
    end
//使能en为低
end

endmodule





