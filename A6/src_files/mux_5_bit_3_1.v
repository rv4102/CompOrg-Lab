`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module mux_5_bit_3_1 (input [4:0] a0, input [4:0] a1, input [4:0] a2, input select_line, output [4:0] out);
    always @(*) begin 
        case (select_line)
            2'b00: out = a0;
            2'b01: out = a1;
            2'b10: out = a2;
            default: 
        endcase
    end
endmodule