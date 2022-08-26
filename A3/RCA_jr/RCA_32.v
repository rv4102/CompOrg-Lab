`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA_32(input[31:0] A, input[31:0] B, input cin, 
                    output[31:0] S, output cout);
    wire carry;                                                 // carry bit used b/w 2 16-bit RCAs
    RCA_16 A1(A[15:0], B[15:0], cin, S[15:0], carry);
    RCA_16 A2(A[31:16], B[31:16], carry, S[31:16], cout);
    // S stores the 32-bit sum output, and cout stores the carry
endmodule