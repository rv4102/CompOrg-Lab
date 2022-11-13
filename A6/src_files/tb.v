`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:03 11/08/2022
// Design Name:   top_module
// Module Name:   C:/Users/Jay Kumar Thakur/risc_kgp_grp69/tb.v
// Project Name:  risc_kgp_grp69
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg rst;
	reg button;
	reg [9:0] add;
	wire [15:0] out;
	

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst),
		.button(button),
		.add(add),
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		button = 0;
		add=0;
		// Wait 100 ns for global reset to finish
		#5 rst = 0;
      #50000 button=1;
		#20 add=0;
		#20 add=1;
		#20 add=2;
		#20 add=3;
		#20 add=4;
		#20 add=5;
		#20 add=6;
		#20 add=7;
		#20 add=8;
		#20 add=9;
		#20;
      $finish;
		// Add stimulus here

	end
      always #10 clk = ~clk;
endmodule

