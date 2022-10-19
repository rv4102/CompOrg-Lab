`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module mux_32_bit_2_1 (input [31:0] a0, input [31:0] a1, input select_line, output [31:0] out);

   always @(*) begin
        case (select_line)
            1'b0: out = a0
            1'b1: out = a1
        endcase
    end
endmodule