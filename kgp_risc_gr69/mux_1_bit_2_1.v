`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module mux_1_bit_2_1 (input a0, input a1, input select_line, output out);
    always @(*) begin
        case (select_line)
            1'b0: out = a0;
            1'b1: out = a1;
        endcase
    end

endmodule