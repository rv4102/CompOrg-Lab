`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module 64bit_RCA(input[63:0] A, input[63:0] B, input cin, 
                    output[63:0] S, output cout);
    wire carry;                                                 // carry bit used b/w 2 32-bit RCAs
    32bit_RCA A1(A[31:0], B[31:0], cin, S[31:0], carry);
    32bit_RCA A2(A[63:32], B[63:32], carry, S[63:32], cout);
    // S stores the 64-bit sum output, and cout stores the carry
endmodule