`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module lca (input [3:0] P, input [3:0] G, input cin,
                output [3:0] c, output p, output g);

    assign c[0] = G[0] | (P[0] & cin);
    assign c[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
    assign c[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
    assign c[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) 
                        | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);

    assign p = P[3] & P[2] & P[1] & P[0];
    assign g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule   