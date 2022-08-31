`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module full_addr(input in1, input in2, input cin, output sum, output carry);
    wire g2_out,g3_out,g4_out;
    xor g1(sum, in1, in2, cin);     // sum = in1 ^ in2 ^ cin
    and g2(g2_out, in1, in2);       // g2_out = in1 & in2
    xor g3(g3_out, in1, in2);       // g3_out = in1 ^ in2
    and g4(g4_out, g3_out, cin);    // g4_out = g3_out & cin
    or  g5(carry, g2_out, g4_out);  // carry = g2_out | g4_out
endmodule