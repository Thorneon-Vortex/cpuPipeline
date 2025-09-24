`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:35 12/12/2024 
// Design Name: 
// Module Name:    DM_EXT 
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
module DM_EXT(
    input wire [1:0] A,
    input wire [31:0] Din,
    input wire [2:0] Op,
    output reg [31:0] Dout
    );
always @(*)begin
	
	if(Op == 3'b010)begin//lb
		if(A == 2'b00)Dout = {{25{Din[7]}},Din[6:0]};
		else if(A == 2'b01)Dout = {{25{Din[15]}},Din[14:8]};
		else if(A == 2'b10)Dout = {{25{Din[23]}},Din[22:16]};
		else if(A == 2'b11)Dout = {{25{Din[31]}},Din[30:24]};
	end else if(Op == 3'b100)begin//lh
		if(A[1] == 1'b0)Dout = {{17{Din[15]}},Din[14:0]};
		else if(A[1] == 1'b1)Dout = {{17{Din[31]}},Din[30:16]};
	end else begin//lw
		Dout = Din;
	end
	
end

endmodule
`default_nettype none