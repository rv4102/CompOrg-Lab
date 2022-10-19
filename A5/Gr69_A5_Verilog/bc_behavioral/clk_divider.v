`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1a
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module clk_divider(input clk, output reg out_clk);
	reg [31:0] cnt = 32'd0;
	parameter factor  = 32'd100000000;
	
	always @(posedge clk) begin
		cnt <= cnt + 32'd1;
		if(cnt >= (factor-1))
			cnt <= 32'd0;
		if(cnt < (factor/2))
			out_clk <= 1'b1;
		else
			out_clk <= 1'b0;
	end
endmodule