`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:52 11/11/2022 
// Design Name: 
// Module Name:    wrapper 
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
module wrapper( input clk, input rst, input button, input [9:0] add, output [15:0] out
    );
	wire clk_out;
	clk_divider c1(.clk(clk), .out_clk(clk_out));
	top_module tm(.clk(clk_out), .rst(rst), .button(button), .add(add), .out(out));

endmodule
