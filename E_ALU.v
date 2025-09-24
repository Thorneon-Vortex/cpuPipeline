`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:00 11/08/2024 
// Design Name: 
// Module Name:    E_ALU 
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

module E_ALU(
    input wire[2:0] ALUcontrol,
    input wire[31:0] Op1,
    input wire [31:0] Op2,
    output reg zero,
    output reg [31:0] ALUResult
    );

always@(*) begin

    if(ALUcontrol == 3'b000)ALUResult = Op1 + Op2;//add,addi
    else if(ALUcontrol == 3'b001)ALUResult = Op1 - Op2;
    else if(ALUcontrol == 3'b010)ALUResult = Op1 | Op2;//ori,orr
    else if(ALUcontrol == 3'b011)ALUResult = (Op1 == Op2)? 32'h1 : 32'h0;
	 else if(ALUcontrol == 3'b100)ALUResult = {Op2[15:0],16'b0};//shift left by 16 bits(lui)
    else if(ALUcontrol == 3'b101)ALUResult = Op1 & Op2;//andd,andi
	 else if(ALUcontrol == 3'b110)ALUResult = ($signed(Op1) < $signed(Op2)) ;//slt
	 else if(ALUcontrol == 3'b111)ALUResult = (Op1 < Op2) ;//sltu
	 
    zero = (ALUResult == 32'h0)? 1'b1 : 1'b0;
end

endmodule
`default_nettype none