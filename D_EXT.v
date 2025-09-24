`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:58:48 11/08/2024 
// Design Name: 
// Module Name:    D_EXT 
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
module D_EXT(
    input wire [15:0] data,
    input wire select,
    output reg [31:0] extended
    );

always @(*)begin

    if(~select)begin

        extended = {16'b0,data};

    end

    else begin

        extended = {{16{data[15]}},data};

    end

end

endmodule
`default_nettype none