`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:46:26 11/22/2024
// Design Name:   F_IFU
// Module Name:   D:/verilogFile/cpuPipeline/ifu_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: F_IFU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ifu_tb;

	// Inputs
	reg [31:0] A;
	reg clk;
	reg reset;
	reg en;

	// Outputs
	wire [31:0] Instr;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	F_IFU uut (
		.A(A), 
		.clk(clk), 
		.reset(reset), 
		.en(en), 
		.Instr(Instr), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		clk = 0;
		reset = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#2
		en = 1;
        
		// Add stimulus here

	end
      
endmodule

