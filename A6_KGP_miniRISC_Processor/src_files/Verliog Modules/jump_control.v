`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module jump_control(input [31:0] result, input carry, input [5:0] opcode, output reg validJump);
    reg zero, sign;
    always @(result) begin
        if (result == 32'b00000000000000000000000000000000) 
            zero = 1'b1;
        else 
            zero = 1'b0;
        sign = result[31];
    end

    always @(*) begin
        case (opcode) 
            6'b001000: begin
                if(sign && !zero)
                    validJump = 1;
                else 
                    validJump = 0;
            end
            6'b001001: begin
                if(!sign && zero) // check
                    validJump = 1;
                else
                    validJump = 0;
            end
            6'b001010: begin
                if(!zero)
                    validJump = 1;
                else
                    validJump = 0;
            end
            6'b001011: begin
                validJump = 1;
            end
            6'b001100: begin
                validJump = 1;
            end
            6'b001101: begin
                validJump = 1;
            end
            6'b001110: begin
                if(carry)
                    validJump = 1;
                else
                    validJump = 0;
            end
            6'b001111: begin
                if(!carry)
                    validJump = 1;
                else 
                    validJump = 0;
            end
				default: begin
					validJump = 0;
				end
        endcase
    
    end
endmodule


    
