`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA_4(input[3:0] A, input[3:0] B, input cin, 
                    output[3:0] S, output cout);
    wire[2:0] carry;                                        // 3-bit wire used to store the carry bit from each Full Adder
    full_addr F1(A[0], B[0], cin, S[0], carry[0]);
    full_addr F2(A[1], B[1], carry[0], S[1], carry[1]);
    full_addr F3(A[2], B[2], carry[1], S[2], carry[2]);
    full_addr F4(A[3], B[3], carry[2], S[3], cout);      // Final output generated
    // S stores the 4-bit sum output, and cout stores the carry
endmodule