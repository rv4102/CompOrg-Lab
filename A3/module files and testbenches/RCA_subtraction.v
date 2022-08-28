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
    
    RCA_64 A1(A, ~B, 1, D, cout);
    
endmodule
