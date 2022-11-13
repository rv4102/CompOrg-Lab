`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD
module top_module(input clk, input rst, input button, input [9:0] add, output [15:0] out);
=======
module top_module(input clk, input rst);
>>>>>>> 1f43ece78d59fcb8d37b0ebe25ae651e7227013f
    wire [5:0] opcode;
    wire [4:0] func, ALUopsel;
    wire [1:0] reg_dest, mem_to_reg;
    wire reg_write, mem_read, mem_write, ALUsrc, ALUipsel, isBranch, JumpAddr, LabelSel;
<<<<<<< HEAD
	 
	 wire [31:0] add_e = {20'd0, {add,2'b00}};
	 wire [31:0] out_d;
	 assign out = out_d[15:0];
	 // always @(posedge clk) begin
	 //	if(rst) out = 0;
	 //	else out = 1;
	 // end
=======

>>>>>>> 1f43ece78d59fcb8d37b0ebe25ae651e7227013f
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
<<<<<<< HEAD
                .func(func),
					 .button(button),
					 .add(add_e),
					 .out(out_d));
=======
                .func(func));
>>>>>>> 1f43ece78d59fcb8d37b0ebe25ae651e7227013f
    
endmodule