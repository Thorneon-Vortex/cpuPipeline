`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:51 11/01/2024 
// Design Name: 
// Module Name:    jump 
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
module D_JUMP(
    input wire PCSrc,
    input wire j,
    input wire jr,
    input wire jal,
    output wire jump
);


assign jump = (PCSrc | jr | jal | j);

endmodule
`default_nettype none