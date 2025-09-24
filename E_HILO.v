`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:01 12/10/2024 
// Design Name: 
// Module Name:    E_HILO 
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
`define mdu_none 4'b0000
`define mdu_div 4'b0001
`define mdu_divu 4'b0010
`define mdu_mult 4'b0011
`define mdu_multu 4'b0100
`define mdu_mfhi 4'b0101
`define mdu_mflo 4'b0110
`define mdu_mthi 4'b0111
`define mdu_mtlo 4'b1000
`define mdu_msub 4'b1001
module E_HILO(
    input wire clk,
    input wire reset,

    input  wire [31:0 ]  A,
    input  wire [31:0 ]  B,
    input  wire [3 :0 ]  MDType,
    //input  [31:0 ]  CalTime,

    output wire [31:0 ]  HIOut,
    output wire [31:0 ]  LOOut,//在外部选择？
    output  wire  Start,
    output   wire  Busy
);
    reg [31:0 ]  hi_reg, lo_reg;
	 reg [31:0] a_reg, b_reg;
    reg [3:0] type_reg;
    wire [31:0] CalTime;//乘除计算指令的延时
	 
	 reg [63:0] tmp1;
	 reg [63:0] tmp2;
	 reg [63:0] temp;
	 
	 

    wire mult   = (MDType == `mdu_mult);
    wire multu  = (MDType == `mdu_multu);
    wire div    = (MDType == `mdu_div);
    wire divu   = (MDType == `mdu_divu);
    wire mflo   = (MDType == `mdu_mflo);
    wire mfhi   = (MDType == `mdu_mfhi);
    wire mtlo   = (MDType == `mdu_mtlo);
    wire mthi   = (MDType == `mdu_mthi);
	 wire msub   = (MDType == `mdu_msub);
	 
    assign HIOut = hi_reg;
    assign LOOut = lo_reg;
    assign Start = (state == 0) && (mult || multu || div || divu || msub);//乘除计算指令
    assign Busy = (state >= 1); 
    assign CalTime = (mult | multu | msub) ? 32'd5:
    (div | divu) ? 32'd10 : 32'd0;

    wire MDEn = (MDType != `mdu_none); 

    reg [31:0] state = 0;
	initial begin
		state = 0;
            hi_reg = 0;
            lo_reg = 0;
            a_reg = 0;
            b_reg = 0;
            type_reg = 0;
	
	end
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
            hi_reg <= 0;
            lo_reg <= 0;
            a_reg <= 0;
            b_reg <= 0;
            type_reg <= 0;
        end
        else begin
            if (state == 0) begin
                if (Start) begin
                    state <= CalTime;
                    a_reg <= A;
                    b_reg <= B;
                    type_reg <= MDType;
                end
                else begin
                    state <= 0;
                    if (mthi) begin
                        hi_reg <= A;
                    end
                    else if (mtlo) begin
                        lo_reg <= A;
                    end
                end
            end 
            else if (state == 1) begin
                state <= state - 1;
                if (type_reg == `mdu_mult) begin
                    {hi_reg, lo_reg} <= $signed(a_reg) * $signed(b_reg);
                end
                else if (type_reg == `mdu_multu) begin
                    {hi_reg, lo_reg} <= a_reg * b_reg;                
                end
                else if (type_reg == `mdu_div) begin
                    hi_reg <= $signed(a_reg) % $signed(b_reg);
                    lo_reg <= $signed(a_reg) / $signed(b_reg);
                end
                else if (type_reg == `mdu_divu) begin
                    hi_reg <= a_reg % b_reg;
                    lo_reg <= a_reg / b_reg;
                end else if(type_reg == `mdu_msub) begin
							//{hi_reg, lo_reg} <= {hi_reg, lo_reg} - $signed($signed(64'd0) + $signed(a_reg) * $signed(b_reg));
							tmp1 = {hi_reg,lo_reg};
							tmp2 = $signed(a_reg) * $signed(b_reg);
							temp = tmp1 - tmp2;
							hi_reg <= temp[63:32];
							lo_reg <= temp[31:0];
							
					 end
                else begin
                    hi_reg <= hi_reg;
                    lo_reg <= lo_reg;
                end
            end
            else 
                state <= state - 1;

        end

    end

endmodule
`default_nettype none