`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:23:18 11/21/2024 
// Design Name: 
// Module Name:    D_STALL 
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
module D_STALL(
    input wire [31:0] d_Instr,
    input wire [2:0] e_Tnew,m_Tnew,w_Tnew,
    input wire e_RegWrite,m_RegWrite,w_RegWrite,
    input wire e_RegDst,m_RegDst,w_RegDst,//判断I型还是R型
    input wire e_jal,m_jal,w_jal,//判断是否是jal指令
	 input wire e_bltzal,m_bltzal,w_bltzal,//判断是不是bltzal
     input wire e_jump,m_jump,w_jump,//
     input wire e_bioal,m_bioal,w_bioal,//
    input wire [31:0]e_Instr,m_Instr,w_Instr,
	input wire Start,Busy,//从E_HILO来的
    output wire stall,
    output reg [2:0] d_Tnew
    );
	 
    wire [5:0] op,func;
    assign op = d_Instr[31:26];
    assign func = d_Instr[5:0];
    wire stall_rs,stall_rt;
    wire stall_rs4,stall_rs3,stall_rs2,stall_rs1,stall_rt4,stall_rt3,stall_rt2,stall_rt1;
    wire [4:0] A1_D,A2_D;
    reg [2:0] rt_Tuse, rs_Tuse;
   
    wire add,sub,ori,lw,sw,beq,lui,jal,jr,R;
	 wire bltzal;//添加bltzal信号
     wire bioal;
     wire bne;
	  
	  wire andd,orr,slt,sltu;
wire addi,andi;
wire lb,lh,sb,sh;

wire div,divu,mult,multu,mfhi,mflo,mthi,mtlo;//乘除指令
wire muldiv;//判断是否是乘除指令
wire msub;


    assign div = R && func == 6'b011010;
    assign divu = R && func == 6'b011011;
    assign mult = R && func == 6'b011000;
    assign multu = R && func == 6'b011001;
    assign mfhi = R && func == 6'b010000;
    assign mflo = R && func == 6'b010010;
    assign mthi = R && func == 6'b010001;
    assign mtlo = R && func == 6'b010011;
	
	assign muldiv = div | divu | mult | multu | mfhi | mflo | mthi | mtlo;


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
 
	  
	  
    wire [4:0] A3_E,A3_M,A3_W;//后面指令写入的寄存器
   
    //assign R = op == 6'b000000;
    assign add = R && func == 6'b100000;
	assign sub = R && func == 6'b100010;
    assign ori = op == 6'b001101;
	assign lw = op == 6'b100011;
	assign sw = op == 6'b101011;
	assign beq = op == 6'b000100;
	assign lui = op == 6'b001111;
	assign jal = op == 6'b000011;
	assign jr = R && func == 6'b001000;
	assign bltzal = (op == 6'b000001)&&(d_Instr[20:16]==5'b10000);
    assign bioal = op == 6'b111111;
    assign bne = op == 6'b000101;
	 assign msub = (op == 6'b011100) && (func == 6'b000100);
	 
     assign A3_E = (e_jal|e_bltzal|(e_bioal & e_jump === 1))? 5'd31 : //添加bltzal
     (e_bioal & e_jump === 0)? 5'd0:
     (e_RegDst) ? e_Instr[15:11] : e_Instr[20:16];
     assign A3_M = (m_jal|m_bltzal|(m_bioal & m_jump === 1))? 5'd31 : 
     (m_bioal & m_jump === 0)? 5'd0:
     (m_RegDst) ? m_Instr[15:11] : m_Instr[20:16];
     assign A3_W = (w_jal|w_bltzal|(w_bioal & w_jump === 1))? 5'd31 : 
     (w_bioal & w_jump === 0)?5'd0:
     (w_RegDst) ? w_Instr[15:11] : w_Instr[20:16];

    assign A1_D = d_Instr[25:21];
    assign A2_D = d_Instr[20:16];
    always @(*) begin

        if(add) begin
            rs_Tuse = 3'b001;
            rt_Tuse = 3'b001;
            d_Tnew = 3'b010;
        end else if(sub) begin
            rs_Tuse = 3'b001;
            rt_Tuse = 3'b001;
            d_Tnew = 3'b010;
        end else if(ori) begin
            rs_Tuse = 3'b001;
            rt_Tuse = 3'b111;
            d_Tnew = 3'b010;
        end else if(lw) begin
            rs_Tuse = 3'b001;
            rt_Tuse = 3'b111;//随便写一个比较大的数？
            d_Tnew = 3'b011;
        end else if(sw) begin
            rs_Tuse = 3'b001;
            rt_Tuse = 3'b010;
            d_Tnew = 3'b0;//无所谓，只读指令，不会写入寄存器
            //不用考虑它对别人的阻塞转发，反正RegWrite是0
        end else if(beq) begin
            rs_Tuse = 3'b0;
            rt_Tuse = 3'b0;
            d_Tnew = 3'b0;//只读指令，不会写入寄存器
            //不用考虑它对别人的阻塞转发，反正RegWrite是0
        end else if(lui) begin
            //只写指令，不用考虑别人对它的阻塞转发
            rs_Tuse = 3'b111;//无所谓
            rt_Tuse = 3'b111;//无所谓
            d_Tnew = 3'b010;
        end else if(jal) begin
            //只写指令，不用考虑别人对它的阻塞转发
            rs_Tuse = 3'b111;//无所谓
            rt_Tuse = 3'b111;//无所谓
            d_Tnew = 3'b0;//这个其实无所谓，PC一开始就"产生"了
        end else if(jr) begin
            //只读指令，不用考虑别人对它的阻塞转发
            rs_Tuse = 3'b0;
            rt_Tuse = 3'b111;
            d_Tnew = 3'b0;//无所谓
        end else if(bltzal) begin
            rt_Tuse = 3'b111;//用不到，赋值一个较大数即可
            rs_Tuse = 3'b000;
            d_Tnew = 3'b000;//和jal一样，也是PC + 8嘛
        end else if(bioal) begin
            rt_Tuse = 3'b0;
            rs_Tuse = 3'b0;
            d_Tnew = 3'b0;
        end else if(bne)begin
            rt_Tuse = 3'b0;
            rs_Tuse = 3'b0;
            d_Tnew = 3'b0;
        end else if(andd)begin
				rt_Tuse = 3'b001;
				rs_Tuse = 3'b001;
				d_Tnew = 3'b010;
		  end else if(andi)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b111;
				d_Tnew = 3'b010;
		  end else if(addi)begin
			   rs_Tuse = 3'b001;
				rt_Tuse = 3'b111;
				d_Tnew = 3'b010;
		  end else if(orr)begin
				rt_Tuse = 3'b001;
				rs_Tuse = 3'b001;
				d_Tnew = 3'b010;
		  end else if(slt)begin
			   rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b010;
		  end else if(sltu)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b010;
		  end else if(mult)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b000;//
		  end else if(multu)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b000;//
		  end else if(div)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b000;//
		  end else if(divu)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b001;
				d_Tnew = 3'b000;//
		  end else if(mthi)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b111;//
				d_Tnew = 3'b000;//
		  end else if(mtlo)begin
				rs_Tuse = 3'b001;
				rt_Tuse = 3'b111;///
				d_Tnew = 3'b000;//
		  end else if(mfhi)begin
				rs_Tuse = 3'b111;//
				rt_Tuse = 3'b111;//
				d_Tnew = 3'b010;
		  end else if(mflo)begin
				rs_Tuse = 3'b111;
				rt_Tuse = 3'b111;
				d_Tnew = 3'b010;
		  end else if(sb) begin
				rs_Tuse = 3'b001;
            rt_Tuse = 3'b010;
            d_Tnew = 3'b0;//无所谓，只读指令，不会写入寄存器
		  end else if(sh) begin
				rs_Tuse = 3'b001;
            rt_Tuse = 3'b010;
            d_Tnew = 3'b0;//无所谓，只读指令，不会写入寄存器
          end else if (lb)begin
             rs_Tuse = 3'b001;
            rt_Tuse = 3'b111;//随便写一个比较大的数？
            d_Tnew = 3'b011;
          end else if(lh)begin
                 rs_Tuse = 3'b001;
            rt_Tuse = 3'b111;//随便写一个比较大的数？
            d_Tnew = 3'b011;
          end else if(msub)begin
					rs_Tuse = 3'b001;
					rt_Tuse = 3'b001;
					d_Tnew = 3'b000;
			 end
    end

assign stall_rs1 = (e_Tnew == 3'b010) 
& (rs_Tuse == 3'b0) & e_RegWrite & (A1_D == A3_E)
&(A1_D != 5'd0);

assign stall_rs2 = (e_Tnew == 3'b001) 
& (rs_Tuse == 3'b0) & e_RegWrite & (A1_D == A3_E)
&(A1_D != 5'd0);

assign stall_rs3 = (m_Tnew == 3'b001) & 
(rs_Tuse == 3'b0) & m_RegWrite & (A1_D == A3_M);

assign stall_rs4 = (e_Tnew == 3'b010) 
& (rs_Tuse == 3'b001) & e_RegWrite & (A1_D == A3_E)
&(A1_D != 5'd0);

//把rs换成rt，A1_D换成A2_D
assign stall_rt1 = (e_Tnew == 3'b010) 
& (rt_Tuse == 3'b0) & e_RegWrite & (A2_D == A3_E)
&(A2_D != 5'd0);

assign stall_rt2 = (e_Tnew == 3'b001) 
& (rt_Tuse == 3'b0) & e_RegWrite & (A2_D == A3_E)
&(A2_D != 5'd0);

assign stall_rt3 = (m_Tnew == 3'b001) & 
(rt_Tuse == 3'b0) & m_RegWrite & (A2_D == A3_M);

assign stall_rt4 = (e_Tnew == 3'b010) 
& (rt_Tuse == 3'b001) & e_RegWrite & (A2_D == A3_E)
&(A2_D != 5'd0);

assign stall_rs = stall_rs1 | stall_rs2 | stall_rs3 | stall_rs4;
assign stall_rt = stall_rt1 | stall_rt2 | stall_rt3 | stall_rt4;
assign stall = stall_rs | stall_rt |(muldiv &&(Start | Busy));

//always @(*)$display("%d %d ",A3_M,A1_D );
endmodule
`default_nettype none