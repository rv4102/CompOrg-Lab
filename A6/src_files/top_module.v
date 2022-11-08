`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module top_module(input clk, input rst);
    wire [5:0] opcode;
    wire [4:0] func, ALUopsel;
    wire [1:0] reg_dest, mem_to_reg;
    wire reg_write, mem_read, mem_write, ALUsrc, ALUipsel, isBranch, JumpAddr, LabelSel;

    control_unit cu(.opcode(opcode), .func(func),
                    .reg_dest(reg_dest),
                    .reg_write(reg_write),
                    .mem_read(mem_read),
                    .mem_write(mem_write),
                    .mem_to_reg(mem_to_reg),
                    .ALUsrc(ALUsrc),
                    .ALUopsel(ALUopsel),
                    .ALUipsel(ALUipsel),
                    .JumpAddr(JumpAddr),
                    .isBranch(isBranch),
                    .LabelSel(LabelSel));
    
    datapath dp(.reg_dest(reg_dest),
                .reg_write(reg_write),
                .mem_read(mem_read),
                .mem_write(mem_write),
                .mem_to_reg(mem_to_reg),
                .ALUsrc(ALUsrc),
                .ALUopsel(ALUopsel),
                .ALUipsel(ALUipsel),
                .JumpAddr(JumpAddr),
                .isBranch(isBranch),
                .LabelSel(LabelSel),
                .clk(clk),
                .rst(rst),
                .opcode(opcode),
                .func(func));
    
endmodule