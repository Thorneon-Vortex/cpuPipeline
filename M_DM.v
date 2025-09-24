`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:29 11/08/2024 
// Design Name: 
// Module Name:    M_DM 
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
module M_DM(
    input wire [31:0] PC,
    input wire [31:0] A,
    input wire [31:0] WD,
    input wire clk,
    input wire WE,
    input wire rst,
    output wire [31:0] RD
    );

reg [31:0] R[0:3071];
	integer i;
	
	initial begin
		for(i = 0;i < 3072;i = i + 1) R[i] = 0;
	end
	
	always @ (posedge clk) begin
		if(rst) begin
			for(i = 0;i < 3072;i = i + 1) R[i] <= 0;
		end 
        else if(WE) 
        begin
			R[A[13:2]] <= WD;
			$display("%d@%h: *%h <= %h", $time, PC - 4, A, WD);
		end
	end
	
	assign RD = R[A[13:2]];

endmodule
`default_nettype none