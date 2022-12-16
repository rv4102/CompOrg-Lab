`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

// Branch Unit to compute the next instruction based on isBranch instructions
module branch_unit (
    input [31:0] PC,
    input [25:0] label0,
    input [15:0] label1,
    input [31:0] rsAddr,
    input labelSel,
    input jumpAddr,
    input isBranch,
    input validJump,
    output [31:0] nextAddr
);

    // Stores the 26-bit and 16-bit sign-extended labels
    wire [31:0] extendLabel0, extendLabel1;
    // Stores output of M1 and M2 respectively.
    wire [31:0] M1out, M2out;
    // Stores output of AND1
    wire isJump;

    assign extendLabel0 = {{6{label0[25]}}, label0};
    assign extendLabel1 = {{16{label1[15]}}, label1};

    and AND1 (isJump, isBranch, validJump);

    mux_32_bit_2_1 M1 (.a0(extendLabel0), .a1(extendLabel1), .select_line(labelSel), .out(M1out));
    mux_32_bit_2_1 M2 (.a0(M1out), .a1(rsAddr), .select_line(jumpAddr), .out(M2out));
    mux_32_bit_2_1 M3 (.a0(PC), .a1(M2out), .select_line(isJump), .out(nextAddr));
    
endmodule