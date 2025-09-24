`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:29 11/19/2024 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input wire clk,
    input wire reset,
    input wire [31:0] i_inst_rdata,
    input wire [31:0] m_data_rdata,
    output wire [31:0] i_inst_addr,
    output wire [31:0] m_data_addr,
    output wire [31:0] m_data_wdata,
    output wire [3 :0] m_data_byteen,
    output wire [31:0] m_inst_addr,
    output wire w_grf_we,
    output wire [4:0] w_grf_addr,
    output wire [31:0] w_grf_wdata,
    output wire [31:0] w_inst_addr
);



//F_IFU的输出
wire [31:0] F_IFU_Instr,F_IFU_PC;
//FD_REG的输出
wire [31:0] FD_REG_D_Instr,FD_REG_D_PC;


//d_controller输出
wire d_controller_ExtControl;
wire [2:0]d_controller_CMPOp;
wire d_controller_branch;
wire [1:0] d_controller_NPCOp;
wire d_controller_j,d_controller_jal;
wire d_controller_RegWrite,d_controller_jr;
wire [4:0] d_controller_A3,d_controller_A2,d_controller_A1;//写指令的写入寄存器
wire d_controller_bltzal;
wire d_controller_bioal;
wire [3:0] d_controller_MDType;

//D_GRF的输出
wire [31:0] D_GRF_RD1,D_GRF_RD2;
//D_CMP的输出
wire D_CMP_PCSrc;
//D_EXT的输出
wire [31:0] D_EXT_extended;
//D_JUMP的输出
wire D_JUMP_jump;
//D_NPC的输出
wire [31:0] D_NPC_npc,D_NPC_pc4;
//DE_REG的输出
wire [31:0] DE_REG_E_Instr,DE_REG_E_PC,DE_REG_E_rs;
wire [31:0] DE_REG_E_rt,DE_REG_E_extended;
wire [2:0] DE_REG_E_Tnew;
wire DE_REG_E_jump;
//D_STALL的输出
wire D_STALL_stall;
wire [2:0] D_STALL_d_Tnew;//这玩意要传入流水线寄存器


//e_controller输出
wire [2:0] e_controller_ALUOp;
wire e_controller_ALUSrc;
wire e_controller_RegWrite,e_controller_RegDst,e_controller_jal;
wire [4:0] e_controller_A3,e_controller_A2,e_controller_A1;//写指令的写入寄存器
wire e_controller_bltzal;
wire e_controller_bioal;
wire [3:0] e_controller_MDType;

//E_ALU的输出
wire [31:0] E_ALU_ALUResult;
wire  E_ALU_zero;//感觉没啥用？
//EM_REG的输出
wire [31:0] EM_REG_M_Instr,EM_REG_M_PC,EM_REG_M_rt,EM_REG_M_ALUResult;
wire [2:0] EM_REG_M_Tnew;
wire EM_REG_M_jump;
wire [31:0] EM_REG_M_HILOResult;

//E_HILO的输出（乘除模块）
wire E_HILO_Start,E_HILO_Busy;
wire [31:0] E_HILO_HIOut,E_HILO_LOOut;

//m_controller输出
wire m_controller_MemWrite;
wire m_controller_RegWrite,m_controller_RegDst,m_controller_jal;
wire [4:0] m_controller_A3,m_controller_A2,m_controller_A1;//写指令的写入寄存器
wire m_controller_bltzal;
wire m_controller_bioal;
wire [3:0] m_controller_MDType;
wire [3:0] m_controller_byteen;//字节使能信号
wire [2:0] m_controller_dm_extOp;

//M_DM的输出
wire [31:0] M_DM_RD;
//MW_REG的输出
wire [31:0] MW_REG_W_Instr,MW_REG_W_PC,MW_REG_W_RD,MW_REG_W_ALUResult;
wire [2:0] MW_REG_W_Tnew;
wire MW_REG_W_jump;
wire [31:0] MW_REG_W_HILOResult;

//DM_EXT
wire [31:0] DM_EXT_Dout;

//w_controller输出
wire w_controller_RegWrite,w_controller_MemtoReg;
wire w_controller_RegDst,w_controller_jal;
wire [4:0] w_controller_A3,w_controller_A2,w_controller_A1;//写指令的写入寄存器
wire w_controller_bltzal;
wire w_controller_bioal;
wire [3:0] w_controller_MDType;





//转发
//1，M->E或W->E（转发到寄存器）优先M->E



wire [31:0] real_E_rs,real_E_rt;
wire [1:0] E_rs_sel,E_rt_sel;
//rs转发
assign E_rs_sel = ((m_controller_A3 == e_controller_A1)&(e_controller_A1!=5'd0)
&(EM_REG_M_Tnew == 3'b000) &(m_controller_RegWrite == 1'b1)) ? 2'b10:
                ((w_controller_A3 == e_controller_A1)&(e_controller_A1!=5'd0)
&(MW_REG_W_Tnew == 3'b000) &(w_controller_RegWrite == 1'b1)) ? 2'b01:2'b00;

//rs的转发记得考虑jal
//mfhi和mflo的转发
assign real_E_rs = (E_rs_sel == 2'b10) ? ((m_controller_jal | m_controller_bltzal | m_controller_bioal)? EM_REG_M_PC + 4 : ((m_controller_MDType == 4'b0101) | (m_controller_MDType == 4'b0110)) ? EM_REG_M_HILOResult : EM_REG_M_ALUResult) :
                   (E_rs_sel == 2'b01) ? ((w_controller_jal | w_controller_bltzal|w_controller_bioal)? MW_REG_W_PC + 4 :W_WD) : DE_REG_E_rs;

//rt转发
assign E_rt_sel = ((m_controller_A3 == e_controller_A2)&(e_controller_A2!=5'd0)
&(EM_REG_M_Tnew ==3'b000) &(m_controller_RegWrite == 1'b1)) ? 2'b10 :
                ((w_controller_A3 == e_controller_A2)&(e_controller_A2!=5'd0)
&(MW_REG_W_Tnew == 3'b000) &(w_controller_RegWrite == 1'b1)) ? 2'b01 : 2'b00;

assign real_E_rt = (E_rt_sel == 2'b10) ? (
                        (m_controller_jal | m_controller_bltzal | m_controller_bioal) ? 
                            (EM_REG_M_PC + 4) : 
                            ((m_controller_MDType == 4'b0101) | (m_controller_MDType == 4'b0110)) ? 
                                EM_REG_M_HILOResult : EM_REG_M_ALUResult
                    ) :
                    (E_rt_sel == 2'b01) ? (
                        (w_controller_jal | w_controller_bltzal | w_controller_bioal) ? 
                            (MW_REG_W_PC + 4) : 
                            W_WD
                    ) : DE_REG_E_rt;

//always @(*)begin
    //if(DE_REG_E_Instr ==32'h02114020)
       // $display("time=%d,real_E_rt:%d",$time,real_E_rt);
//end
//M->D
wire [31:0] real_D_rs,real_D_rt;
wire D_rs_sel,D_rt_sel;
//rs转发
//M级ALUResult转发到D级的rs或rt
assign D_rs_sel = ((m_controller_A3 == d_controller_A1)&(d_controller_A1 != 5'd0)
&(EM_REG_M_Tnew == 3'b000)&(m_controller_RegWrite == 1'b1)) ? 1'b1 : 1'b0;

//rs的转发记得考虑jal
assign real_D_rs = D_rs_sel ? ((m_controller_jal | m_controller_bltzal|m_controller_bioal)? EM_REG_M_PC + 4 :((m_controller_MDType == 4'b0101) | (m_controller_MDType == 4'b0110)) ? EM_REG_M_HILOResult : EM_REG_M_ALUResult) : D_GRF_RD1 ;

//rt转发
assign D_rt_sel = ((m_controller_A3 == d_controller_A2)&(d_controller_A2 != 5'd0)
&(EM_REG_M_Tnew == 3'b000)&(m_controller_RegWrite == 1'b1)) ? 1'b1 : 1'b0;

assign real_D_rt = D_rt_sel ?((m_controller_jal | m_controller_bltzal|m_controller_bioal)? EM_REG_M_PC + 4 : ((m_controller_MDType == 4'b0101) | (m_controller_MDType == 4'b0110)) ? EM_REG_M_HILOResult :EM_REG_M_ALUResult):D_GRF_RD2 ;


//W->M
wire [31:0] real_M_rt;
wire M_rt_sel;
//rt转发
assign M_rt_sel = ((w_controller_A3 == m_controller_A2)&(m_controller_A2 != 5'd0)
&(MW_REG_W_Tnew == 3'b000)&(w_controller_RegWrite == 1'b1)) ? 1'b1 : 1'b0;

assign real_M_rt = M_rt_sel ? ((w_controller_jal | w_controller_bltzal|w_controller_bioal) ? MW_REG_W_PC + 4 :W_WD) : EM_REG_M_rt ;

//FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF



//F_IFU实例化
wire [31:0] F_IFU_A;
wire F_IFU_en;//阻塞时使用

assign F_IFU_A = (D_JUMP_jump === 1'b1)? D_NPC_npc : F_IFU_PC + 4;//这里要加入选择
//assign F_IFU_en = ??阻塞时使用
assign F_IFU_en = (D_STALL_stall === 1'b1)? 1'b0 : 1'b1;
assign F_IFU_Instr = i_inst_rdata;

reg [31:0] PC = 32'h00003000;


always @ (posedge clk) begin
		if(reset) begin
			PC <= 32'h00003000;
		end else if(F_IFU_en) begin
			PC <= F_IFU_A;
			end
			//使能为0，则不进行指令的执行
	end
	
assign F_IFU_PC = PC;
assign i_inst_addr = PC;
//always @(*) $display("i_inst_addr = %h,i_inst_rdata = %h ",i_inst_addr,i_inst_rdata);


//FD_REG实例化
wire [31:0] FD_REG_F_Instr,FD_REG_F_PC;
wire FD_REG_en;//阻塞时使用
assign FD_REG_F_Instr = F_IFU_Instr;
assign FD_REG_F_PC = F_IFU_PC + 4;//传入加4之后的PC
//assign FD_REG_en = ??阻塞时使用
assign FD_REG_en = (D_STALL_stall === 1'b1) ? 1'b0 : 1'b1;

FD_REG fd_reg(
    .F_Instr(FD_REG_F_Instr),
    .F_PC(FD_REG_F_PC),
    .D_Instr(FD_REG_D_Instr),
    .D_PC(FD_REG_D_PC),
    .clk(clk),
    .reset(reset),
    .en(FD_REG_en)
);



//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD



//d_controller实例化

wire [31:0] d_controller_Instr;
wire d_controller_jump;

assign d_controller_Instr = FD_REG_D_Instr;
assign d_controller_jump = D_JUMP_jump;

CONTROLLER d_controller(
    .Instr(d_controller_Instr),
    .ExtControl(d_controller_ExtControl),
    .CMPOp(d_controller_CMPOp),
    .Branch(d_controller_branch),
    .NPCOp(d_controller_NPCOp),
    .j1(d_controller_j),
    .jal1(d_controller_jal),
    .jr1(d_controller_jr),
    .A3(d_controller_A3),
    .A2(d_controller_A2),
    .A1(d_controller_A1),
    .bltzal1(d_controller_bltzal),
    .jump(d_controller_jump),
    .bioal1(d_controller_bioal)
);




//D_GRF实例化
wire [4:0] D_GRF_A1,D_GRF_A2,D_GRF_A3;
wire [31:0] D_GRF_WD,D_GRF_PC;
wire D_GRF_WE;

assign D_GRF_A1 = FD_REG_D_Instr[25:21];
assign D_GRF_A2 = FD_REG_D_Instr[20:16];
assign D_GRF_A3 = W_A3;
assign D_GRF_WD = W_WD;
assign D_GRF_WE = w_controller_RegWrite;//W级controler产生的RegWrite信号
assign D_GRF_PC = MW_REG_W_PC - 4;//W级的PC信号

D_GRF d_grf(
    .PC(D_GRF_PC),
    .A1(D_GRF_A1),
    .A2(D_GRF_A2),
    .A3(D_GRF_A3),
    .WD(D_GRF_WD),
    .WE(D_GRF_WE),
    .RD1(D_GRF_RD1),
    .RD2(D_GRF_RD2),
    .clk(clk),
    .reset(reset)
);


//D_CMP实例化
wire D_CMP_branch;//连接本级controller产生的branch信号
wire [2:0] D_CMP_CMPOp;//选择是哪个b型跳转指令
wire [31:0] D_CMP_rs_value,D_CMP_rt_value;//rs和rt的值

//assign D_CMP_branch = 本级controller产生的branch信号
assign D_CMP_branch = d_controller_branch;
//assign D_CMP_CMPOp = 本级controller产生的CMPOp
assign D_CMP_CMPOp = d_controller_CMPOp;
assign D_CMP_rs_value = real_D_rs;
assign D_CMP_rt_value = real_D_rt;

D_CMP d_cmp(
    .branch(D_CMP_branch),
    .CMPOp(D_CMP_CMPOp),
    .rs_value(D_CMP_rs_value),
    .rt_value(D_CMP_rt_value),
    .PCSrc(D_CMP_PCSrc),
    .bltzal(d_controller_bltzal),
    .bioal(d_controller_bioal)
);

//D_EXT实例化
wire [15:0] D_EXT_data;
wire D_EXT_select;

assign D_EXT_data = FD_REG_D_Instr[15:0];
//assign D_EXT_select = 本级controller产生的ExtControl信号;
assign D_EXT_select = d_controller_ExtControl;

D_EXT d_ext(
    .data(D_EXT_data),
    .select(D_EXT_select),
    .extended(D_EXT_extended)
);

//D_JUMP实例化
wire D_JUMP_PCSrc;
wire D_JUMP_j,D_JUMP_jr,D_JUMP_jal;

assign D_JUMP_PCSrc = D_CMP_PCSrc;
//assign D_JUMP_j = 本级controller产生的j信号
//assign D_JUMP_jr = 本级controller产生的jr信号
//assign D_JUMP_jal = 本级controller产生的jal信号
assign D_JUMP_j = d_controller_j;
assign D_JUMP_jr = d_controller_jr;
assign D_JUMP_jal = d_controller_jal;

D_JUMP d_jump(
    .PCSrc(D_JUMP_PCSrc),
    .j(D_JUMP_j),
    .jr(D_JUMP_jr),
    .jal(D_JUMP_jal),
    .jump(D_JUMP_jump)
);

//D_NPC实例化
wire [31:0] D_NPC_PC,D_NPC_rs;
wire [15:0] D_NPC_imm16;
wire [25:0] D_NPC_imm26;
wire [1:0] D_NPC_NPCOp;
wire D_NPC_jumper;

assign D_NPC_PC = FD_REG_D_PC;
assign D_NPC_rs = real_D_rs;
assign D_NPC_imm16 = FD_REG_D_Instr[15:0];
assign D_NPC_imm26 = FD_REG_D_Instr[25:0];
//assign D_NPC_NPCOp = 本级controller产生的NPCOp
assign D_NPC_NPCOp = d_controller_NPCOp;
assign D_NPC_jumper = D_JUMP_jump;

D_NPC d_npc(
    .PC(D_NPC_PC),
    .rs(D_NPC_rs),
    .imm16(D_NPC_imm16),
    .imm26(D_NPC_imm26),
    .NPCOp(D_NPC_NPCOp),
    .jumper(D_NPC_jumper),
    .npc(D_NPC_npc),
    .PC4(D_NPC_pc4)
);
//D_STALL实例化
wire [31:0] D_STALL_d_Instr,D_STALL_e_Instr,D_STALL_m_Instr,D_STALL_w_Instr;
wire [2:0] D_STALL_e_Tnew,D_STALL_m_Tnew,D_STALL_w_Tnew;
wire D_STALL_e_RegWrite,D_STALL_m_RegWrite,D_STALL_w_RegWrite;
wire D_STALL_e_RegDst,D_STALL_m_RegDst,D_STALL_w_RegDst;
wire D_STALL_e_jal,D_STALL_m_jal,D_STALL_w_jal;
wire D_STALL_Start,D_STALL_Busy;

assign D_STALL_Start = E_HILO_Start;
assign D_STALL_Busy = E_HILO_Busy;


assign D_STALL_d_Instr = FD_REG_D_Instr;
assign D_STALL_e_Instr = DE_REG_E_Instr;
assign D_STALL_m_Instr = EM_REG_M_Instr;
assign D_STALL_w_Instr = MW_REG_W_Instr;
//把D_STALL_d_Tnew传入流水线寄存器

assign D_STALL_e_Tnew = DE_REG_E_Tnew;
assign D_STALL_m_Tnew = EM_REG_M_Tnew;
assign D_STALL_w_Tnew = MW_REG_W_Tnew;

assign D_STALL_e_RegWrite = e_controller_RegWrite;
assign D_STALL_m_RegWrite = m_controller_RegWrite;
assign D_STALL_w_RegWrite = w_controller_RegWrite;

assign D_STALL_e_RegDst = e_controller_RegDst;
assign D_STALL_m_RegDst = m_controller_RegDst;
assign D_STALL_w_RegDst = w_controller_RegDst;

assign D_STALL_e_jal = e_controller_jal;
assign D_STALL_m_jal = m_controller_jal;
assign D_STALL_w_jal = w_controller_jal;

D_STALL d_stall(
    .d_Instr(D_STALL_d_Instr),
    .e_Instr(D_STALL_e_Instr),
    .m_Instr(D_STALL_m_Instr),
    .w_Instr(D_STALL_w_Instr),
    .d_Tnew(D_STALL_d_Tnew),
    .e_Tnew(D_STALL_e_Tnew),
    .m_Tnew(D_STALL_m_Tnew),
    .w_Tnew(D_STALL_w_Tnew),
    .e_RegWrite(D_STALL_e_RegWrite),
    .m_RegWrite(D_STALL_m_RegWrite),
    .w_RegWrite(D_STALL_w_RegWrite),
    .e_RegDst(D_STALL_e_RegDst),
    .m_RegDst(D_STALL_m_RegDst),
    .w_RegDst(D_STALL_w_RegDst),
    .e_jal(D_STALL_e_jal),
    .m_jal(D_STALL_m_jal),
    .w_jal(D_STALL_w_jal),
    .stall(D_STALL_stall),
    .e_bltzal(e_controller_bltzal),
    .m_bltzal(m_controller_bltzal),
    .w_bltzal(w_controller_bltzal),
    .e_jump(DE_REG_E_jump),
    .m_jump(EM_REG_M_jump),
    .w_jump(MW_REG_W_jump),
    .e_bioal(e_controller_bioal),
    .m_bioal(m_controller_bioal),
    .w_bioal(w_controller_bioal),
    .Start(D_STALL_Start),
    .Busy(D_STALL_Busy)
);



//DE_REG实例化
wire [31:0] DE_REG_D_Instr,DE_REG_D_PC,DE_REG_D_rs,DE_REG_D_rt;
wire [31:0] DE_REG_D_extended;
wire DE_REG_clr;
wire [2:0] DE_REG_D_Tnew;
wire DE_REG_D_jump;


assign DE_REG_D_Instr = FD_REG_D_Instr;
assign DE_REG_D_PC = FD_REG_D_PC;
assign DE_REG_D_rs = real_D_rs;
assign DE_REG_D_rt = real_D_rt;
assign DE_REG_D_extended = D_EXT_extended;
//assign DE_REG_clr = 阻塞时使用,DE_REG在下个clock上升沿到来时被清除为0
assign DE_REG_clr = (D_STALL_stall === 1'b1) ? 1'b1 : 1'b0;
assign DE_REG_D_Tnew = D_STALL_d_Tnew;
assign DE_REG_D_jump = D_JUMP_jump;

DE_REG de_reg(
    .D_Instr(DE_REG_D_Instr),
    .D_PC(DE_REG_D_PC),
    .D_rs(DE_REG_D_rs),
    .D_rt(DE_REG_D_rt),
    .D_extended(DE_REG_D_extended),
    .E_Instr(DE_REG_E_Instr),
    .E_PC(DE_REG_E_PC),
    .E_rs(DE_REG_E_rs),
    .E_rt(DE_REG_E_rt),
    .E_extended(DE_REG_E_extended),
    .clk(clk),
    .reset(reset),
    .en(1'b1),
    .clr(DE_REG_clr),
    .D_Tnew(DE_REG_D_Tnew),
    .E_Tnew(DE_REG_E_Tnew),
    .D_jump(DE_REG_D_jump),
    .E_jump(DE_REG_E_jump)
);




//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE






//e_controller实例化
wire [31:0] e_controller_Instr;
wire e_controller_jump;

assign e_controller_Instr = DE_REG_E_Instr;
assign e_controller_jump = DE_REG_E_jump;

CONTROLLER e_controller(
    .Instr(e_controller_Instr),
    .ALUOp(e_controller_ALUOp),
    .ALUSrc(e_controller_ALUSrc),
    .RegWrite(e_controller_RegWrite),
    .RegDst(e_controller_RegDst),
    .jal1(e_controller_jal),
    .A3(e_controller_A3),
    .A2(e_controller_A2),
    .A1(e_controller_A1),
    .bltzal1(e_controller_bltzal),
    .jump(e_controller_jump),
    .bioal1(e_controller_bioal),
    .MDType(e_controller_MDType)
);

//E_HILO实例化
wire [31:0] E_HILO_A,E_HILO_B;
wire [3:0] E_HILO_MDType;

assign E_HILO_A = real_E_rs;
assign E_HILO_B = real_E_rt;
assign E_HILO_MDType = e_controller_MDType;
//always @(*)$display("real_E_rs = %d,real_E_rt = %d,m_controller_MDType = %b",real_E_rs,real_E_rt,m_controller_MDType);
E_HILO e_hilo(
    .clk(clk),
    .reset(reset),
    .A(E_HILO_A),
    .B(E_HILO_B),
    .MDType(E_HILO_MDType),

    .HIOut(E_HILO_HIOut),
    .LOOut(E_HILO_LOOut),
    .Start(E_HILO_Start),
    .Busy(E_HILO_Busy)
);









//E_ALU实例化
wire [2:0] E_ALU_ALUcontrol;
wire [31:0] E_ALU_Op1,E_ALU_Op2;

//assign E_ALU_ALUcontrol = 本级controller产生的ALUOp
assign E_ALU_ALUcontrol = e_controller_ALUOp;
assign E_ALU_Op1 = real_E_rs;
assign E_ALU_Op2 = (e_controller_ALUSrc)? DE_REG_E_extended : real_E_rt;
//ALUSrc是本级controller产生的ALUSrc

E_ALU e_alu(
    .ALUcontrol(E_ALU_ALUcontrol),
    .Op1(E_ALU_Op1),
    .Op2(E_ALU_Op2),
    .ALUResult(E_ALU_ALUResult),
    .zero(E_ALU_zero)
);


//EM_REG实例化
wire [31:0] EM_REG_E_Instr,EM_REG_E_PC,EM_REG_E_rt,EM_REG_E_ALUResult;
wire [2:0] EM_REG_E_Tnew;
wire EM_REG_E_jump;
wire [31:0] EM_REG_E_HILOResult;


assign EM_REG_E_HILOResult = (e_controller_MDType == 4'b0101) ? E_HILO_HIOut
          :(e_controller_MDType == 4'b0110) ? E_HILO_LOOut : 0;//选择流水的hi（mfhi）还是lo（mflo）

assign EM_REG_E_Instr = DE_REG_E_Instr;
assign EM_REG_E_PC = DE_REG_E_PC;
assign EM_REG_E_rt =  real_E_rt;
assign EM_REG_E_ALUResult = E_ALU_ALUResult;
assign EM_REG_E_Tnew = DE_REG_E_Tnew;
assign EM_REG_E_jump = DE_REG_E_jump;//流水


EM_REG em_reg(

    .clk(clk),
    .reset(reset),
    .E_Instr(EM_REG_E_Instr),
    .E_PC(EM_REG_E_PC),
    .E_ALUResult(EM_REG_E_ALUResult),
    .E_rt(EM_REG_E_rt),
    .en(1'b1),
    .M_Instr(EM_REG_M_Instr),
    .M_PC(EM_REG_M_PC),
    .M_rt(EM_REG_M_rt),
    .M_ALUResult(EM_REG_M_ALUResult),
   .M_Tnew(EM_REG_M_Tnew),
   .E_Tnew(EM_REG_E_Tnew),
   .E_jump(EM_REG_E_jump),
   .M_jump(EM_REG_M_jump),
   .E_HILOResult(EM_REG_E_HILOResult),
   .M_HILOResult(EM_REG_M_HILOResult)

);






//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM






//m_controller实例化
wire [31:0] m_controller_Instr;
wire m_controller_jump;
wire [31:0] m_controller_m_ALUResult;

assign m_controller_Instr = EM_REG_M_Instr;
assign m_controller_jump = EM_REG_M_jump;
assign m_controller_m_ALUResult = EM_REG_M_ALUResult;

CONTROLLER m_controller(
    .Instr(m_controller_Instr),
    .MemWrite(m_controller_MemWrite),
    .RegWrite(m_controller_RegWrite),
    .RegDst(m_controller_RegDst),
    .jal1(m_controller_jal),
    .A3(m_controller_A3),
    .A2(m_controller_A2),
    .A1(m_controller_A1),
    .bltzal1(m_controller_bltzal),
    .jump(m_controller_jump),
    .bioal1(m_controller_bioal),
    .MDType(m_controller_MDType),
    .m_ALUResult(m_controller_m_ALUResult),
    .byteen(m_controller_byteen),
    .dm_extOp(m_controller_dm_extOp)
);
//always@(*)$display("time = %d,byteen =%b,m_controller_Instr = %h,m_controller_m_ALUResult = %h",$time,m_controller_byteen,m_controller_Instr,m_controller_m_ALUResult);

//DM
//always@(*)$display("time = %d,m_controller_byteen = %b,m_data_wdata = %h,m_controller_Instr = %h,real_M_rt = %h",$time,m_controller_byteen ,m_data_wdata,m_controller_Instr,real_M_rt);
assign m_data_addr =  EM_REG_M_ALUResult;


//assign m_data_wdata = real_M_rt ;


assign m_data_wdata = (m_controller_byteen == 4'b1111) ? real_M_rt:
(m_controller_byteen == 4'b0001) ? {{24{1'b0}},real_M_rt[7:0]} :
(m_controller_byteen == 4'b0010) ? {{16{1'b0}},real_M_rt[7:0],{8{1'b0}}} :
(m_controller_byteen == 4'b0100) ? {{8{1'b0}},real_M_rt[7:0],{16{1'b0}}} :
(m_controller_byteen == 4'b1000) ? {real_M_rt[7:0],{24{1'b0}}} :
(m_controller_byteen == 4'b0011) ? {{16{1'b0}},real_M_rt[15:0]} :
(m_controller_byteen == 4'b1100) ? {real_M_rt[15:0],{16{1'b0}}} : 32'h0;

assign m_inst_addr = EM_REG_M_PC - 4;//因为流水的是PC + 4，这里-4
assign m_data_byteen = m_controller_byteen;
assign M_DM_RD = DM_EXT_Dout;//DM的输出

//assign m_data_rdata = DM_EXT_Dout;

//always@(*)$display("time = %d,m_controller_byteen = %b,m_data_wdata = %d",$time,m_controller_byteen,m_data_wdata);
//always@(*)$display("time = %d,M_DM_RD = %d",$time,M_DM_RD);









//DM_EXT实例化
wire [1:0] DM_EXT_A;
wire [31:0] DM_EXT_Din;
wire [2:0] DM_EXT_Op;
assign DM_EXT_A = EM_REG_M_ALUResult[1:0];
assign DM_EXT_Din = m_data_rdata;//DM的输出
assign DM_EXT_Op = m_controller_dm_extOp;
DM_EXT dm_ext(
    .A(DM_EXT_A),
    .Din(DM_EXT_Din),
    .Op(DM_EXT_Op),
    .Dout(DM_EXT_Dout)
);
//always@(*)$display("A = %b,Din = %h,Op = %b,Dout = %h",DM_EXT_A,DM_EXT_Din,DM_EXT_Op,DM_EXT_Dout);

//MW_REG实例化
wire [31:0] MW_REG_M_Instr,MW_REG_M_PC,MW_REG_M_RD,MW_REG_M_ALUResult;
wire [2:0] MW_REG_M_Tnew;
wire MW_REG_M_jump;
wire [31:0] MW_REG_M_HILOResult;


assign MW_REG_M_HILOResult = EM_REG_M_HILOResult;

assign MW_REG_M_Instr = EM_REG_M_Instr;
assign MW_REG_M_PC = EM_REG_M_PC;
assign MW_REG_M_RD = M_DM_RD;
assign MW_REG_M_ALUResult = EM_REG_M_ALUResult;
assign MW_REG_M_Tnew = EM_REG_M_Tnew;
assign MW_REG_M_jump = EM_REG_M_jump;

MW_REG mw_reg(
    .M_Instr(MW_REG_M_Instr),
    .M_PC(MW_REG_M_PC),
    .M_RD(MW_REG_M_RD),
    .M_ALUResult(MW_REG_M_ALUResult),
    .W_Instr(MW_REG_W_Instr),
    .W_PC(MW_REG_W_PC),
    .W_RD(MW_REG_W_RD),
    .W_ALUResult(MW_REG_W_ALUResult),
    .clk(clk),
    .reset(reset),
    .en(1'b1),
    .M_Tnew(MW_REG_M_Tnew),
    .W_Tnew(MW_REG_W_Tnew),
    .M_jump(MW_REG_M_jump),
    .W_jump(MW_REG_W_jump),
    .M_HILOResult(MW_REG_M_HILOResult),
    .W_HILOResult(MW_REG_W_HILOResult)
);

//写回寄存器writeback

//W_controller实例化
wire [31:0] w_controller_Instr;
wire w_controller_jump;

assign w_controller_Instr = MW_REG_W_Instr;
assign w_controller_jump = MW_REG_W_jump;


CONTROLLER w_controller(
    .Instr(w_controller_Instr),
    .RegDst(w_controller_RegDst),
    .MemtoReg(w_controller_MemtoReg),
    .RegWrite(w_controller_RegWrite),
    .jal1(w_controller_jal),
    .A3(w_controller_A3),
    .A2(w_controller_A2),
    .A1(w_controller_A1),
    .bltzal1(w_controller_bltzal),
    .jump(w_controller_jump),
    .bioal1(w_controller_bioal),
    .MDType(w_controller_MDType)
);

//写回D_GRF
//由本级的W_controller产生的W_RegWrite信号决定是否写回寄存器
//由本级W_controller产生的W_RegDst判断写入寄存器是哪几位，0是I型，1是R型
wire [4:0] W_A3 ;//写回寄存器的地址
wire [31:0] W_WD;//写回寄存器的值
//always @(*)$display("e_controller_MDType = %d,time = %d,E_HILO_LOOut = %d,real_E_rs = %d,real_E_rt = %d,E_HILO_MDType =%d,EM_REG_M_ALUResult = %d",e_controller_MDType,$time,E_HILO_LOOut,real_E_rs,real_E_rt,E_HILO_MDType,EM_REG_M_ALUResult);
//always @(*)begin
  //  if(FD_REG_D_Instr == 32'hFD090002)$display("d_controller_bioal = %d,D_jump = %d,D_CMP_PCSrc =%d,real_D_rs = %d,real_D_rt = %d,stall = %d",d_controller_bioal,D_JUMP_jump,D_CMP_PCSrc,real_D_rs,real_D_rt,D_STALL_stall);
//end
assign W_A3 = (w_controller_jal | w_controller_bltzal |(w_controller_bioal & MW_REG_W_jump === 1)) ? 5'b11111:
(w_controller_bioal & MW_REG_W_jump === 0)? 5'd0 :
(w_controller_RegDst) ? MW_REG_W_Instr[15:11] : MW_REG_W_Instr[20:16];

assign W_WD = (w_controller_jal | w_controller_bltzal |w_controller_bioal) ? (MW_REG_W_PC + 4) : 
(w_controller_MemtoReg) ? MW_REG_W_RD : 
(w_controller_MDType == 4'b110 | w_controller_MDType == 4'b101) ? MW_REG_W_HILOResult:MW_REG_W_ALUResult;//添加乘除指令的写入选择

//always@(*)$display("%d",MW_REG_W_RD);
assign w_grf_we = w_controller_RegWrite;
assign w_grf_addr = W_A3;
assign w_grf_wdata = W_WD;
assign w_inst_addr = MW_REG_W_PC - 4;//流水的是PC + 4，这里-4

endmodule
`default_nettype none

