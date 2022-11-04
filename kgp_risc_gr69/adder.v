`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module adder(input [31:0] A, input [31:0] B, input cin, output sum[31:0], output cout);
    wire carry_1;
    bit_16 a1 (.A(A[15:0]), .B(B[15:0]), .cin(cin), .sum(sum[15:0], .cout(carry_1)));
    bit_16 a2 (.A(A[31:16]), .B(B[31:16]), .cin(carry_1), .sum(sum[31:16]), .cout(cout));

endmodule
