`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1b
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module add_by_1(input [3:0] A, output [3:0] sum);
	wire[3:0] C;
	
	and a1(C[2], A[0], A[1]);
	and a2(C[3], C[2], A[2]);
	not n1(sum[0], A[0]);
	xor x1(sum[1], A[1], A[0]);
	xor x2(sum[2], A[2], C[2]);
	xor x3(sum[3], A[3], C[3]);
	
endmodule