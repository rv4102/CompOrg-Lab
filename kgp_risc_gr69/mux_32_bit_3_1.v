`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module mux_32_bit_3_1 (input [31:0] a0, input [31:0] a1, input [31:0] a2, input select_line, output out);
    always @(*) begin 
        case (select_line)
            2'b00: out = a0;
            2'b01: out = a1;
            2'b10: out = a2;
        endcase
    end
endmodule