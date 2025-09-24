`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:09 11/08/2024 
// Design Name: 
// Module Name:    D_GRF 
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
module D_GRF (
    input wire [31:0] PC,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD,
    input wire clk,
    input wire reset,
    input wire WE,
    output wire[31:0] RD1,
    output wire [31:0] RD2
    );
    reg [31:0] R[0:31];
	integer i;
	
	initial begin
		for(i = 0;i < 32;i = i + 1) R[i] = 0;
	end
	
    //下跳沿触发，不需要内部转发
	always @ (negedge clk) begin
		if(reset) begin
			for(i = 1;i < 32;i = i + 1) R[i] <= 0;
		end 
        else if(WE&&A3!=0) 
        begin
            
			R[A3] <= WD;
			//$display("%d@%h: $%d <= %h", $time, PC, A3, WD);
		end
	end

	assign RD1 = R[A1];
	assign RD2 = R[A2];

endmodule
`default_nettype none
