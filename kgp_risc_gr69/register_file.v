`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module register_file(input [4:0] rs, 
                     input [4:0] rt,
                     input reg_write,
                     input [4:0] reg_to_write,
                     input [31:0] data_to_write,
                     input clk,
                     input rst,
                     output reg[31:0] rd1,
                     output reg[31:0] rd2);
    reg signed [31:0] registerBank [31:0];
    integer i;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i = 0;i < 32;i = i+1)
                registerBank[i] <= 32'b0;
        end else if (reg_write) begin
            registerBank[reg_to_write] <= data_to_write;
        end
    end

    always @(*) begin
        rd1 = registerBank[rs];
        rd2 = registerBank[rt];
    end

endmodule