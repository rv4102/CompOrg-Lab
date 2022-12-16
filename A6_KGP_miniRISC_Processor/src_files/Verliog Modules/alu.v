`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module alu (input [31:0] A, input [31:0] B, input ALUipsel, input [4:0] ALUopsel, output reg [31:0] result, output reg carry);

    wire [31:0] mux1_out, mux2_out;

    mux_32_bit_2_1 m1(.a0(A), .a1(32'b00000000000000000000000000000001), .select_line(ALUipsel), .out(mux1_out));
    mux_32_bit_2_1 m2(.a0(B), .a1(~B) ,.select_line(ALUipsel), .out(mux2_out));

    wire [31:0] sum, and_r, xor_r, out_shift;
	 wire carry_wire;

    adder a1(.A(mux1_out), .B(mux2_out), .cin(1'b0), .sum(sum), .cout(carry_wire));
    assign and_r = mux1_out & mux2_out;
    assign xor_r = mux1_out ^ mux2_out;
    shift_module sm(.A(mux1_out), .shamt(mux2_out), .is_left(ALUopsel[1]), .is_arithmetic(ALUopsel[0]), .out(out_shift));

    wire [31:0] diff;
    wire [31:0] n;
    assign n = mux1_out ^ mux2_out;
    wire [31:0] sumt;
	 adder a2(.A(n), .B(32'b11111111111111111111111111111111), .cin(1'b0), .sum(sumt), .cout());

    wire [31:0] input_diff;
    assign input_diff = n & (~sumt);

    diff_module dm(.in(input_diff), .out(diff));

    always @(*) begin
        if(ALUopsel == 5'b00000) begin
            result = mux1_out;
        end else if (ALUopsel == 5'b00001) begin
            carry = carry_wire;
            result = sum;
        end else if (ALUopsel == 5'b00010) begin
            result = sum;
        end else if (ALUopsel == 5'b00110) begin
            result = sum;
        end else if (ALUopsel == 5'b00011) begin
            result = and_r;
        end else if (ALUopsel == 5'b00100) begin
            result = xor_r;
        end else if (ALUopsel[4:2] == 3'b010) begin
            result = out_shift;
        end else if (ALUopsel == 5'b00101) begin
            result = diff;
        end else begin 
            result = 32'b00000000000000000000000000000000;
        end
    end

endmodule





