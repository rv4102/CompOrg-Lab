`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1a
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module clk_divider(input clk, output reg out_clk = 0);
	integer counter = 0;
	
	// 4999999 will give 10Hz output  
	always@ (posedge clk) begin
		if(counter == 4999999) begin
			counter <= 0;
			out_clk <= ~out_clk;
		end 
		else begin
			counter <= counter + 1;
			out_clk <= out_clk;
		end
	end
endmodule
