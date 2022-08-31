`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bit_4_augment (input [3:0] A, input [3:0] B, input cin, 
                    output [3:0] sum, output P', output G');
    
    wire [3:0] P;
    wire [3:0] G;
    wire [3:0] C;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = cin;
    
    assign C[1] = G[0] | (P[0] & C[0]);
    
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);;
    
    assign C[3] = G[2] |(P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]); 
    
    //assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);
    
    //assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & carry[0]);

    assign sum = P^C;
    
    assign P' = P[3] & P[2] & P[1] & P[0];
	assign G' = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule
