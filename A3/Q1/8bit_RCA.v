`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module 8bit_RCA(input[7:0] A, input[7:0] B, input cin, 
                    output[7:0] S, output cout);
    wire[6:0] carry;                                        // 7-bit wire used to store the carry bit from each Full Adder
    full_addr F1(A[0], B[0], cin, S[0], carry[0]);
    full_addr F2(A[1], B[1], carry[0], S[1], carry[1]);
    full_addr F3(A[2], B[2], carry[1], S[2], carry[2]);
    full_addr F4(A[3], B[3], carry[2], S[3], carry[3]);
    full_addr F5(A[4], B[4], carry[3], S[4], carry[4]);
    full_addr F6(A[5], B[5], carry[4], S[5], carry[5]);
    full_addr F7(A[6], B[6], carry[5], S[6], carry[6]);
    full_addr F8(A[7], B[7], carry[6], S[7], cout);         // Final output generated
    // S stores the 8-bit sum output, and cout stores the carry
endmodule