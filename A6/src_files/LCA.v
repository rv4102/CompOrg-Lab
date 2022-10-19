`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module lca (input [3:0] p, input [3:0] g, input cin, output [3:0] c, output  cout);

    assign c[0] = (cin & p[0]) | g[0];
    assign c[1] = (cin & p[0] & p[1]) | (g[0] & p[1]) | (g[1]);
    assign c[2] = (cin & p[0] & p[1] & p[2]) | (g[0] & p[1] & p[2]) | (g[1] & p[2]) | g[2];
    assign c[3] = (cin & p[0] & p[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (g[1] & p[2] & p[3]) | (g[2] & p[3]) | (g[3]);
    assign cout = c[3];

endmodule
 

