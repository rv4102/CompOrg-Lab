`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1b
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
////////////////////////////////////////////////////////////////////////////////

module bin_cnt_strc_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	bin_cnt_strc uut (
		.clk(clk), 
		.rst(rst), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 0;
		#200;
		rst = 1;
		#50
		rst = 0;
	end
	always #10 clk = ~clk;
      
endmodule

