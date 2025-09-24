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
	input wire reset,//�첽��λ
	input wire en,//ʹ���ź�
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
			D_PC <= 0;   // �첽��λ������Ĵ���
        end else if (en) begin
		  D_Instr <= F_Instr;     // ��ʹ���ź�Ϊ��ʱ���¼Ĵ���
			D_PC <= F_PC;
        end
        // ��� en Ϊ�ͣ����� ֵ����
    end


endmodule
`default_nettype none