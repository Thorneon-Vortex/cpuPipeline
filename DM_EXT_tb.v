`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:56:02 12/14/2024
// Design Name:   DM_EXT
// Module Name:   D:/verilogFile/cpuPipeline/DM_EXT_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DM_EXT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DM_EXT_tb;

	// Inputs
	reg [1:0] A;
	reg [31:0] Din;
	reg [2:0] Op;

	// Outputs
	wire [31:0] Dout;

	// Instantiate the Unit Under Test (UUT)
	DM_EXT uut (
		.A(A), 
		.Din(Din), 
		.Op(Op), 
		.Dout(Dout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		Din = 0;
		Op = 0;

		// Wait 100 ns for global reset to finish
		#5
		A = 2'b01;
		Din = 32'h0000ffff;
		Op = 3'b010;
        
		// Add stimulus here

	end
      
endmodule

