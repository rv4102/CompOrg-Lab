`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1a
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bin_cnt_bhvl(input wire clk, input wire rst, output reg[3:0] counter = 4'b0000);
	wire delayed_clock; // 10 Hz clock to update counter
	clk_divider clk1(.clk(clk), .out_clk(delayed_clock)); // 10 Hz Clock divider
	
   // both clock and reset added to sensitivity list to perform asynchronous reset
   always @(posedge delayed_clock or posedge rst) begin
		if(rst == 1)
			counter <= 4'b0000;     // set count to 0 if reset is pressed
		else
			counter <= counter + 4'b0001;
   end
endmodule