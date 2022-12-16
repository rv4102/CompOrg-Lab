`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module mux_32_bit_2_1 (input [31:0] a0, input [31:0] a1, input select_line, output [31:0] out);
   assign out = (select_line)? a1:a0;
endmodule