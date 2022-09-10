`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1b
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module dff(input wire clk, input wire d, output reg q);
    always @(posedge clk) begin
        q <= d;
    end
endmodule