`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module instruction_decoder (input [31:0] instruction_set, 
                            output [5:0] opcode,
                            output [4:0] rs,
                            output [4:0] rt,
                            output [4:0] shamt,
                            output [4:0] func,
                            output [15:0] imm,
                            output [15:0] label1,
                            output [26:0] label2);

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign shamt = instruction[15:11];
    assign func = instruction[4:0];
    assign imm = instruction[15:0];
    assign label1 = instruction[15:0];
    assign label2 = instruction[26:0];
    
endmodule