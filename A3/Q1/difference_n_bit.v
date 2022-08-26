`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA_sub(input[63:0] A, input[63:0] B, 
                    output[63:0] D, output cout);
    nor(B,B,B);
    RCA_64(A[63:0], B[63:0], 1, D[63:0], cout);
    
endmodule
