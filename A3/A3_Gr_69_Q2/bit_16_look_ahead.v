`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bit_16_lookahead (input [15:0] A, input [15:0] B,input cin, 
                            output [15:0] sum, output cout, output P', output G');
    
    wire [3:0] P, G, C;
    bit_4_augment b1(.A(A[3:0]), .B(B[3:0]), .cin(cin), .sum(sum[3:0]), .P'(P[0]), .G'(G[0]));
    bit_4_augment b2(.A(A[7:4]), .B(B[7:4]), .cin(C[0]), .sum(sum[7:4]), .P'(P[1]), .G'(G[1]));
    bit_4_augment b3(.A(A[11:8]), .B(B[11:8]), .cin(C[1]), .sum(sum[11:8]), .P'(P[2]), .G'(G[2]));
    bit_4_augment b4(.A(A[15:12]), .B(B[15:12]), .cin(C[2]), .sum(sum[15:12]), .P'(P[3]), .G'(G[3]));
    lca lcunit(.P(P), .G(G), .cin(cin), .c(C), .P'(P'), .G'(G')); 
    assign cout = C[3];

endmodule
