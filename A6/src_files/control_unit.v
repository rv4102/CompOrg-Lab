`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module control_unit (input [5:0] opcode, input [4:0] func,
                     output reg [1:0] reg_dest,
                     output reg reg_write,
                     output reg mem_read,
                     output reg mem_write,
                     output reg [1:0] mem_to_reg,
                     output reg ALUsrc,
                     output reg [4:0] ALUopsel,
                     output reg ALUipsel,
                     output reg JumpAddr
                     output reg isBranch,
                     output reg LabelSel);

    always @(opcode or func) begin
        case(opcode)
            6'b000000 : begin
                case(func)
                    5'b00000 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00001;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00001: begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00010;
                        ALUipsel = 1'b1;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    default: : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b0;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00000;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0; 
                        LabelSel = 1'b0;
                    end
                endcase
            end
            6'b000001 : begin
                case (func)
                    5'b00000 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00011;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0; 
                    end
                    5'b00001 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00100;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    default : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b0;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00000;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0; 
                        LabelSel = 1'b0;
                    end
                endcase
            end
            6'b000010 : begin
                case (func) 
                    5'b00000 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUopsel = 5'b01010;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00001 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUopsel = 5'b01000;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00010 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b01010;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00011 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b01000;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00100 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b1;
                        ALUopsel = 5'b01001;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    5'b00101 : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b1;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b10;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b01001;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0;
                        LabelSel = 1'b0;
                    end
                    default : begin
                        reg_dest = 2'b00;
                        reg_write = 1'b0;
                        mem_read = 1'b0;
                        mem_write = 1'b0;
                        mem_to_reg = 2'b00;
                        ALUsrc = 1'b0;
                        ALUopsel = 5'b00000;
                        ALUipsel = 1'b0;
                        isBranch = 1'b0;
                        JumpAddr = 1'b0; 
                        LabelSel = 1'b0;
                    end
                endcase
            end
            6'b000011 : begin
                reg_dest = 2'b00;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00101;
                ALUipsel = 1'b0;
                isBranch = 1'b0;
                JumpAddr = 1'b0;
                LabelSel = 1'b0;
            end
            6'b000100 : begin
                reg_dest = 2'b00;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b1;
                ALUopsel = 5'b00001;
                ALUipsel = 1'b0;
                isBranch = 1'b0;
                JumpAddr = 1'b0;
                LabelSel = 1'b0;
            end
            6'b000101 : begin
                reg_dest = 2'b00;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b1;
                ALUopsel = 5'b00010;
                ALUipsel = 1'b1;
                isBranch = 1'b0;
                JumpAddr = 1'b0;
                LabelSel = 1'b0;
            end
            6'b000110 : begin
                reg_dest = 2'b01;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                mem_to_reg = 2'b01;
                ALUsrc = 1'b1;
                ALUopsel = 5'b00110;
                ALUipsel = 1'b0;
                isBranch = 1'b0;
                JumpAddr = 1'b0;
                LabelSel = 1'b0;
            end
            6'b000111 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b1;
                ALUopsel = 5'b00110;
                ALUipsel = 1'b0;
                isBranch = 1'b0;
                JumpAddr = 1'b0;
                LabelSel = 1'b0;
            end
            6'b001000 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b1;
            end
            6'b001001 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b1;
            end
            6'b001010 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b1;
            end
            6'b001011 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b1; 
                LabelSel = 1'b0;
            end
            6'b001100 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b0;
            end
            6'b001101 : begin
                reg_dest = 2'b10;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b0;
            end
            6'b001110 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b0;
            end
            6'b001111 : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b1;
                JumpAddr = 1'b0; 
                LabelSel = 1'b0;
            end
            default : begin
                reg_dest = 2'b00;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUopsel = 5'b00000;
                ALUipsel = 1'b0;
                isBranch = 1'b0;
                JumpAddr = 1'b0; 
                LabelSel = 1'b0;
            end
        endcase
    end
endmodule