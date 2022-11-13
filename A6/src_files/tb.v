`timescale 1ns / 1ps

<<<<<<< HEAD
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

=======
//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module tb;
    reg clk;
    reg rst;

    top_module kgprisc(.clk(clk), .rst(rst));
    
    initial begin
        clk = 0;
        rst = 1;

        #5 rst = 0;

        #2095
        $display("Content in register 19: %d", kgprisc.dp.rf.registerBank[19]);
        if(kgprisc.dp.rf.registerBank[19] == -1) begin
            $display("element not found");
        end else begin
            $display("Element found at index: %d", kgprisc.dp.rf.registerBank[19]))
        end
        $finish;
    end

    always begin
        #10 clk = ~clk;
    end
endmodule
>>>>>>> 1f43ece78d59fcb8d37b0ebe25ae651e7227013f
