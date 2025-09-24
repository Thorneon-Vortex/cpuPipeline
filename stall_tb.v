`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:32:58 11/30/2024
// Design Name:   D_STALL
// Module Name:   D:/verilogFile/cpuPipeline/stall_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_STALL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stall_tb;

	// Inputs
	reg [31:0] d_Instr;
	reg [2:0] e_Tnew;
	reg [2:0] m_Tnew;
	reg [2:0] w_Tnew;
	reg e_RegWrite;
	reg m_RegWrite;
	reg w_RegWrite;
	reg e_RegDst;
	reg m_RegDst;
	reg w_RegDst;
	reg e_jal;
	reg m_jal;
	reg w_jal;
	reg e_bltzal;
	reg m_bltzal;
	reg w_bltzal;
	reg [31:0] e_Instr;
	reg [31:0] m_Instr;
	reg [31:0] w_Instr;

	// Outputs
	wire stall;
	wire [2:0] d_Tnew;

	// Instantiate the Unit Under Test (UUT)
	D_STALL uut (
		.d_Instr(d_Instr), 
		.e_Tnew(e_Tnew), 
		.m_Tnew(m_Tnew), 
		.w_Tnew(w_Tnew), 
		.e_RegWrite(e_RegWrite), 
		.m_RegWrite(m_RegWrite), 
		.w_RegWrite(w_RegWrite), 
		.e_RegDst(e_RegDst), 
		.m_RegDst(m_RegDst), 
		.w_RegDst(w_RegDst), 
		.e_jal(e_jal), 
		.m_jal(m_jal), 
		.w_jal(w_jal), 
		.e_bltzal(e_bltzal), 
		.m_bltzal(m_bltzal), 
		.w_bltzal(w_bltzal), 
		.e_Instr(e_Instr), 
		.m_Instr(m_Instr), 
		.w_Instr(w_Instr), 
		.stall(stall), 
		.d_Tnew(d_Tnew)
	);

	initial begin
		// Initialize Inputs
		d_Instr = 0;
		e_Tnew = 0;
		m_Tnew = 0;
		w_Tnew = 0;
		e_RegWrite = 0;
		m_RegWrite = 0;
		w_RegWrite = 0;
		e_RegDst = 0;
		m_RegDst = 0;
		w_RegDst = 0;
		e_jal = 0;
		m_jal = 0;
		w_jal = 0;
		e_bltzal = 0;
		m_bltzal = 0;
		w_bltzal = 0;
		e_Instr = 0;
		m_Instr = 0;
		w_Instr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

