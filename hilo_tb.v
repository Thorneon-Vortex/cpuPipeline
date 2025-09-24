`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:18:46 12/11/2024
// Design Name:   E_HILO
// Module Name:   D:/verilogFile/cpuPipeline/hilo_tb.v
// Project Name:  cpuPipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: E_HILO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hilo_tb;

	// Inputs
	 reg clk;
	 reg reset;
	 reg [31:0] A;
	 reg [31:0] B;
 reg [3:0] MDType;

	// Outputs
	 wire [31:0] HIOut;
 wire [31:0] LOOut;
	 wire Start;
	 wire Busy;

	// Instantiate the Unit Under Test (UUT)
	E_HILO uut (
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B), 
		.MDType(MDType), 
		.HIOut(HIOut), 
		.LOOut(LOOut), 
		.Start(Start), 
		.Busy(Busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		A = 0;
		B = 0;
		MDType = 0;

		// Wait 100 ns for global reset to finish
		#2;
		reset = 0;
		A = 12;
		B = 4;
		#3;
		MDType = 4'b0011;
        
		

	end
      always #5 clk = ~clk;
endmodule

