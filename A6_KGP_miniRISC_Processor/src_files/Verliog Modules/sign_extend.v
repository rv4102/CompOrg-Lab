`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////


module sign_extend (input [5:0] opcode, input [4:0] func, input [15:0] instruction, output reg [31:0] out);
    
    always @(*) begin
        if(opcode == 6'b000010) begin
            out = {{27{1'b0}},instruction[15:11]};
        end else begin
            out = {{16{instruction[15]}}, instruction};
        end
    end

endmodule