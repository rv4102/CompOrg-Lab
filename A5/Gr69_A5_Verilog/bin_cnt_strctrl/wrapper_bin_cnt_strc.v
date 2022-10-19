`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:36 09/14/2022 
// Design Name: 
// Module Name:    wrapper_bin_cnt_strc 
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
module wrapper(input clk, input rst, output reg[3:0] counter);
	wire [3:0] counter_net;
	always @ (posedge clk)
		 begin
			  counter <= counter_net;
		 end

	bin_cnt_strc(clk, rst, counter_net);
endmodule