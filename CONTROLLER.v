`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:32:43 11/08/2024 
// Design Name: 
// Module Name:    CONTROLLER 
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

module CONTROLLER (
   // input wire [5:0] op,
    //input wire [5:0] func,
    input wire [31:0] Instr,
	 input wire jump,
     output wire bioal1,
    output wire bltzal1,
    output wire RegWrite,
    output wire RegDst,
    output wire ALUSrc,
    output wire Branch,
    output wire MemWrite,
    output wire MemtoReg,
    output wire [2:0] ALUOp,
    output wire [2:0] CMPOp,
	 output wire ExtControl,
	 output wire [1:0] NPCOp,
	 output wire jal1,
	 output wire jr1,
	 output wire j1,
     output wire [4:0] A3,//如果是写指令，输出写入地址
     output wire [4:0] A2,//R型读指令的rt，I型不需要
     output wire [4:0] A1,//指令的rs
     output wire muldiv,//判断是否是乘除指令
	  output wire [3:0] MDType,
      output wire [3:0] byteen,
      input wire [31:0] m_ALUResult,//sb,sh
      output wire [2:0] dm_extOp
    );

wire [5:0] op, func;
assign op = Instr[31:26];
assign func = Instr[5:0];

wire R, add, sub, ori, beq, lui, jal, jr,j;
wire div,divu,mult,multu,mfhi,mflo,mthi,mtlo;//乘除指令
wire bne,bltzal;	
wire bioal;//
wire andd,orr,slt,sltu;
wire addi,andi;
wire lb,lh,lw,sb,sh,sw;
wire msub;//
    assign R = op == 6'b000000;

    assign andd = R && func == 6'b100100;
    assign orr = R && func == 6'b100101;
    assign slt = R && func == 6'b101010;
    assign sltu = R && func == 6'b101011;
    assign addi = op == 6'b001000;
    assign andi = op == 6'b001100;
   assign lb = op == 6'b100000;
   assign lh = op == 6'b100001;
   
   assign sb = op == 6'b101000;
   assign sh = op == 6'b101001;
 

assign msub = (op == 6'b011100) && (func == 6'b000100);//新增


    assign div = R && func == 6'b011010;
    assign divu = R && func == 6'b011011;
    assign mult = R && func == 6'b011000;
    assign multu = R && func == 6'b011001;
    assign mfhi = R && func == 6'b010000;
    assign mflo = R && func == 6'b010010;
    assign mthi = R && func == 6'b010001;
    assign mtlo = R && func == 6'b010011;

    assign muldiv = msub|div | divu | mult | multu | mfhi | mflo | mthi | mtlo ? 1 : 0;

	
	assign add = R && func == 6'b100000;
	assign sub = R && func == 6'b100010;
	assign ori = op == 6'b001101;
	assign lw = op == 6'b100011;
	assign sw = op == 6'b101011;
	assign beq = op == 6'b000100;
	assign lui = op == 6'b001111;
	assign jal = op == 6'b000011;
	assign jr = R && func == 6'b001000;
    assign j = op == 6'b000010;
	assign bne = op == 6'b000101;
	assign bltzal = (op == 6'b000001)&&(Instr[20:16] == 5'b10000);
	assign bioal = op == 6'b111111;//添加指令
	

    assign byteen = sw ? 4'b1111 :
	(sb && m_ALUResult[1:0] == 2'b00)? 4'b0001 :
    (sb && m_ALUResult[1:0] == 2'b01)? 4'b0010 :
    (sb && m_ALUResult[1:0] == 2'b10)? 4'b0100 :
    (sb && m_ALUResult[1:0] == 2'b11)? 4'b1000 :
    (sh && m_ALUResult[1] == 1'b0)? 4'b0011 :
    (sh && m_ALUResult[1] == 1'b1)? 4'b1100 : 4'b0;
	
	assign MDType = (div) ? 4'b0001
	:(msub)? 4'b1001//新增
	:(divu) ? 4'b0010
	: (mult) ? 4'b0011
	: (multu) ? 4'b0100
	: (mfhi) ? 4'b0101
	: (mflo) ? 4'b0110
	: (mthi) ? 4'b0111
	: (mtlo) ? 4'b1000 : 4'b0;
	

    assign dm_extOp = lb ? 3'b010 :
        lh ? 3'b100 : 3'b0;

    assign CMPOp = bne? 3'b001 : 3'b0;

	assign MemtoReg =
	lh|lb|lw? 1:
	0;
	
    assign RegWrite =
		lh|lb|mflo|mfhi|slt|sltu|orr|addi|andi|andd | bioal | sub | add | ori | lw | lui | jal | bltzal ? 1 ://和jal一样，需要写入
		0;

    assign RegDst =
        mfhi|mflo|sltu|slt|orr|andd |add | sub ? 1 : 
        0;

    assign ALUSrc = 
       sh|sb|lh|lb|addi|andi| ori | lw | sw | lui ? 1 :
        0;
    
    assign Branch = 
        beq | bne ? 1 ://这里不需要把bltzal加上，因为cmp中bltzal指令自成一个if判断
        0;

    assign MemWrite = 
        sh|sb|sw ? 1 :
        0;

    assign ALUOp[2] = 
        sltu|slt|andi|andd |lui ? 1:
        0;

    assign ALUOp[1] = 
        sltu|slt|orr|ori ? 1:
        0;
    
    assign ALUOp[0] =
       sltu|andi| andd| beq | sub ? 1 :
        0;

    assign ExtControl =
      sb|sh|lh|lb|orr|addi|andd| bne | bioal|add | sub | lw | sw | beq | lui|bltzal ? 1 :
        0;

    assign NPCOp[1] = 
        jal | jr | j ? 1 :
        0;

    assign NPCOp[0] =
      bne | bioal| bltzal| beq | jr ? 1 ://NPC跳转行为和beq一样，而不是和jal一样
        0;

    assign jal1 = jal;
    assign jr1 = jr;
    assign j1 = j;
	 assign bltzal1 = bltzal;//添加的bltzal1信号
     assign bioal1 = bioal;

    assign A3 = jal|bltzal|(bioal & jump === 1) ? 5'b11111//和jal一样，写入31号寄存器
    :(bioal & jump === 0) ? 5'b0
    : R ? Instr[15:11] : Instr[20:16];//写入地址(该输出信号是为了转发）

    assign A1 = Instr[25:21];//rs（该输出信号是为了转发）
    assign A2 = Instr[20:16];//rt（该输出信号是为了转发）

endmodule
`default_nettype none