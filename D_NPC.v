`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:52 11/01/2024 
// Design Name: 
// Module Name:    D_NPC 
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
module D_NPC(
    input wire [31:0] PC,          // 
    input wire [15:0] imm16,       // 
    input wire [25:0] imm26,       // 
    input wire [31:0] rs,          // 
    input wire [1:0] NPCOp,        //
    input wire jumper,               // 
    output reg [31:0] npc,    // 
    output reg [31:0] PC4     //
);


always @(*) begin
    PC4 = PC + 4; //

    if (jumper) begin
        case (NPCOp)
            2'b00: npc = PC+4; //
            2'b01: npc = ({{16{imm16[15]}}, imm16} << 2) + PC ; //beq,bne
            2'b10: npc = {PC[31:28], imm26, 2'b0}; // j,jal
            2'b11: npc = rs; // jr
        endcase
    end else begin
        npc = PC + 4; // 
    end
end

endmodule
`default_nettype none
