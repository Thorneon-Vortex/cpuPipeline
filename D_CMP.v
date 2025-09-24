`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:39 11/19/2024 
// Design Name: 
// Module Name:    D_CMP 
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
module D_CMP(
    input wire branch,
    input wire [2:0] CMPOp,
	 input wire [31:0] rs_value,
	 input wire [31:0] rt_value,
    output reg PCSrc,
	 input wire bltzal,
	 input wire bioal
    );
	 
always @(*)begin
    if(bioal)begin
        PCSrc = (rs_value < rt_value);//一个例子而已
    end else begin
	    if(bltzal)begin
			    if(rs_value[31] == 1)PCSrc = 1;
	    end else begin
			    if(branch)begin
			
				    if(CMPOp == 3'b0)PCSrc = (rs_value == rt_value);//beq
				    else if(CMPOp == 3'b001)PCSrc = (rs_value != rt_value);//bne
				    else if(CMPOp == 3'b010)PCSrc = (rs_value < rt_value);//blt
			//etc.
			
			end
			else PCSrc = 0;
		end
    end
end


endmodule
`default_nettype none