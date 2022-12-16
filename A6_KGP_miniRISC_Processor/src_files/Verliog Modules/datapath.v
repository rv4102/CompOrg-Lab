`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module datapath(input [1:0] reg_dest,
                input reg_write,
                input mem_read,
                input mem_write,
                input [1:0] mem_to_reg,
                input ALUsrc,
                input [4:0] ALUopsel,
                input ALUipsel,
                input JumpAddr,
                input isBranch,
                input LabelSel,
                input clk,
                input rst,
					 input [31:0] add,
					 input button,
                output [5:0] opcode,
                output [4:0] func,
					 output [31:0] out);
    
    parameter ra = 5'b11111;
    wire enable, carry, isJump, prev_carry;
    wire [31:0] nextInstr, intr, writedata, readdata1, intraddr, result, nextPC, readdata2, se1out, b, datamemreaddata;
    wire [25:0] label0;
    wire [15:0] label1, imm;
    wire [4:0] rs, rt, writeReg;
    wire [31:0] offset, mem_add;

    assign enable = mem_read | mem_write | button;
    assign offset = nextInstr >>> 2'b10;
	assign out = datamemreaddata;

	mux_32_bit_2_1 m4(.a0(result), .a1(add), .select_line(button), .out(mem_add));
    dff DFF(.clk(clk), .reset(rst), .d(carry), .q(prev_carry));
    program_counter PC(.nextinstr(nextInstr), .clk(clk), .rst(rst), .intraddr(intraddr));
    instr_mem im(.clka(clk), .ena(1'b1), .addra(offset[9:0]), .douta(intr));
    instruction_decoder instrDecoder(.instruction_set(intr), .opcode(opcode), .func(func), .label1(label1), .label2(label0), .rs(rs), .rt(rt), .imm(imm), .shamt());
    mux_5_bit_3_1 m1(.a0(rs), .a1(rt), .a2(ra), .select_line(reg_dest), .out(writeReg));
    register_file rf(.rs(rs), .rt(rt), .reg_write(reg_write), .reg_to_write(writeReg), .data_to_write(writedata), .clk(clk), .rst(rst), .rd1(readdata1), .rd2(readdata2));
    sign_extend se(.opcode(opcode), .func(func), .instruction(imm), .out(se1out));
    mux_32_bit_2_1 m2(.a0(readdata2), .a1(se1out), .select_line(ALUsrc), .out(b));
    alu alu1(.A(readdata1), .B(b), .ALUipsel(ALUipsel), .ALUopsel(ALUopsel), .result(result), .carry(carry));
    jump_control jc(.result(result), .carry(prev_carry), .opcode(opcode), .validJump(isJump));
    PC_increment pc(.instrAddr(intraddr), .nextPC(nextPC));
    branch_unit bu(.PC(nextPC), .label0(label0), .label1(label1), .rsAddr(readdata1), .labelSel(LabelSel), .jumpAddr(JumpAddr), .isBranch(isBranch), .validJump(isJump), .nextAddr(nextInstr));
    data_mem dm(.clka(~clk), .ena(enable), .wea(mem_write), .addra(mem_add[9:0] >>> 2'b10), .dina(readdata2), .douta(datamemreaddata));
    mux_32_bit_3_1 m3(.a0(nextPC), .a1(datamemreaddata), .a2(result), .select_line(mem_to_reg), .out(writedata));

endmodule