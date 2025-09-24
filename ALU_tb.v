`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:06 11/29/2024
// Design Name:   E_ALU
// Module Name:   D:/verilogFile/cpuPipeline/ALU_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: E_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [2:0] ALUcontrol;
	reg [31:0] Op1;
	reg [31:0] Op2;
	

	// Outputs
	wire zero;
	wire [31:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	E_ALU uut (
		.ALUcontrol(ALUcontrol), 
		.Op1(Op1), 
		.Op2(Op2), 
		.zero(zero), 
		.ALUResult(ALUResult)
	
	);

	initial begin
		// Initialize Inputs
		ALUcontrol = 0;
		Op1 = 0;
		Op2 = 0;
		//fz = 0;

		// Wait 100 ns for global reset to finish
		#10
		Op1 = 32'hf0000000;
		Op2 = 32'hf0000002;
		#2
		ALUcontrol = 3'b110;
		
		//fz = 1;
        //期望结果ALUResult = 10011111
		// Add stimulus here

	end
      
endmodule

