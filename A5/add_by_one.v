`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1b
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module add_by_one(input [3:0] A, output [3:0] sum, output cout);
    // we use 4-bit CLA with input B = 4'b0000 and cin = 1'b1
    // since both those values are fixed, we calculate the rest of the fields
    // and optimise the circuit needed
    wire [3:0] P;
    wire [3:0] C;

    assign P = A;

    assign C[0] = 1'b1;
    assign C[1] = P[0] & C[0];
    assign C[2] = P[1] & P[0] & C[0];
    assign C[3] = P[2] & P[1] & P[0] & C[0]; 
    assign cout = P[3] & P[2] & P[1] & P[0] & C[0];

    assign sum = P^C;
endmodule