`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module half_addr(input in1, input in2, output sum, output carry);
    xor g1(sum, in1, in2);      // XOR of in1 and in2 to get the sum
    and g2(carry, in1, in2);    // AND of in1 and in2 to get the carry
endmodule
