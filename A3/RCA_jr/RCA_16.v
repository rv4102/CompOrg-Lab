`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA_16(input[15:0] A, input[15:0] B, input cin, 
                    output[15:0] S, output cout);
    wire carry;                                             // carry bit used b/w 2 8-bit RCAs
    RCA_8 A1(A[7:0], B[7:0], cin, S[7:0], carry);
    RCA_8 A2(A[15:8], B[15:8], carry, S[15:8], cout);
    // S stores the 16-bit sum output, and cout stores the carry
endmodule