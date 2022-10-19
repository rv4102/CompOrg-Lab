`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1b
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bin_cnt_strc(input clk, input rst, output [3:0] counter);
	wire [3:0] adder_out;
	wire clk_out;

	clk_divider cd1(.clk(clk), .out_clk(clk_out));
	
	
	dff d1(.rst(rst), .clk(clk_out), .d(adder_out[0]), .q(counter[0]));
	dff d2(.rst(rst), .clk(clk_out), .d(adder_out[1]), .q(counter[1]));
	dff d3(.rst(rst), .clk(clk_out), .d(adder_out[2]), .q(counter[2]));
	dff d4(.rst(rst), .clk(clk_out), .d(adder_out[3]), .q(counter[3]));
	
	add_by_1 a1(.A(counter), .sum(adder_out));
	
endmodule