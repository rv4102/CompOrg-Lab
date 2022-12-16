`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:57:27 11/08/2022
// Design Name:   alu
// Module Name:   C:/Users/Jay Kumar Thakur/risc_kgp_grp69/alu_tb.v
// Project Name:  risc_kgp_grp69
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg ALUipsel;
	reg [4:0] ALUopsel;

	// Outputs
	wire [31:0] result;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.ALUipsel(ALUipsel), 
		.ALUopsel(ALUopsel), 
		.result(result), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		 $monitor("time = %0d, a = %d, b = %d, ALUsel = %b, ALUop = %b, carry = %b, result = %b", $time, A, B, ALUipsel, ALUopsel, carry, result);
        B = 32'b00000000000000000000000000000111;
        A = 32'b00000000000000000000000000000011;
        ALUipsel = 1'b0;
        ALUopsel = 5'b00000;
        #5 ALUopsel = 5'b00001;
        #5 ALUopsel = 5'b00101;
        #5 ALUopsel = 5'b00110;
        #5 ALUopsel = 5'b00011;
        #5 ALUopsel = 5'b00100;
        #5 ALUopsel = 5'b01010;
        #5 ALUopsel = 5'b01000;
        #5 ALUopsel = 5'b01010;
        #5 ALUopsel = 5'b01000;
        #5 ALUopsel = 5'b01001;
        #5 ALUopsel = 5'b01001;

        #5 ALUipsel = 1'b1; ALUopsel = 5'b00001;
        #5 ALUopsel = 5'b00001;
        #5 ALUopsel = 5'b00110;
        #5 ALUopsel = 5'b00010;
        #5 ALUopsel = 5'b00011;
        #5 ALUopsel = 5'b01010;
        #5 ALUopsel = 5'b01000;
        #5 ALUopsel = 5'b01010;
        #5 ALUopsel = 5'b01000;
        #5 ALUopsel = 5'b01001;
        #5 ALUopsel = 5'b01001;  
        #5 $finish;
		// Add stimulus here

	end
      
endmodule

