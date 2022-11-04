`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1a
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module wrapper_bin_cnt_bhvl(input clk, input rst, output reg[3:0] counter);
	wire [3:0] counter_net;
	always @ (posedge clk) begin
		counter <= counter_net;
	end

	bin_cnt_bhvl bc(clk, rst, counter_net);
endmodule