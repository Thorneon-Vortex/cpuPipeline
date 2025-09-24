`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:12:41 12/05/2024
// Design Name:   D_CMP
// Module Name:   D:/verilogFile/cpuPipeline/cmp_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_CMP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmp_tb;

	// Inputs
	reg branch;
	reg [2:0] CMPOp;
	reg [31:0] rs_value;
	reg [31:0] rt_value;
	reg bltzal;
	reg bioal;

	// Outputs
	wire PCSrc;

	// Instantiate the Unit Under Test (UUT)
	D_CMP uut (
		.branch(branch), 
		.CMPOp(CMPOp), 
		.rs_value(rs_value), 
		.rt_value(rt_value), 
		.PCSrc(PCSrc), 
		.bltzal(bltzal), 
		.bioal(bioal)
	);

	initial begin
		// Initialize Inputs
		branch = 0;
		CMPOp = 0;
		rs_value = 0;
		rt_value = 0;
		bltzal = 0;
		bioal = 0;

		// Wait 100 ns for global reset to finish
		#2
		rs_value = 1;
		rt_value = 2;
		bioal = 1;
		
        
		// Add stimulus here

	end
      
endmodule

