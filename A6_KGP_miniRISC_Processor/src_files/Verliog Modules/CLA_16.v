`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bit_16 (input [15:0] A, input [15:0] B, input cin,
                        output [15:0] sum, output cout);
        
    wire [2:0] c;

    bit_4 a1(.A(A[3:0]), .B(B[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c[0]));
    bit_4 a2(.A(A[7:4]), .B(B[7:4]), .cin(c[0]), .sum(sum[7:4]), .cout(c[1]));
    bit_4 a3(.A(A[11:8]), .B(B[11:8]), .cin(c[1]), .sum(sum[11:8]), .cout(c[2]));
    bit_4 a4(.A(A[15:12]), .B(B[15:12]), .cin(c[2]), .sum(sum[15:12]), .cout(cout));
    
endmodule