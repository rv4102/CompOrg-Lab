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
    always @(posedge clk or posedge rst) begin
        if(rst) begin
                registerBank[0] <= 32'b0;
					 registerBank[1] <= 32'b0;
					 registerBank[2] <= 32'b0;
					 registerBank[3] <= 32'b0;
					 registerBank[4] <= 32'b0;
					 registerBank[5] <= 32'b0;
					 registerBank[6] <= 32'b0;
					 registerBank[7] <= 32'b0;
					 registerBank[8] <= 32'b0;
					 registerBank[9] <= 32'b0;
					 registerBank[10] <= 32'b0;
					 registerBank[11] <= 32'b0;
					 registerBank[12] <= 32'b0;
					 registerBank[13] <= 32'b0;
					 registerBank[14] <= 32'b0;
					 registerBank[15] <= 32'b0;
					 registerBank[16] <= 32'b0;
					 registerBank[17] <= 32'b0;
					 registerBank[18] <= 32'b0;
					 registerBank[19] <= 32'b0;
					 registerBank[20] <= 32'b0;
					 registerBank[21] <= 32'b0;
					 registerBank[22] <= 32'b0;
					 registerBank[23] <= 32'b0;
					 registerBank[24] <= 32'b0;
					 registerBank[25] <= 32'b0;
					 registerBank[26] <= 32'b0;
					 registerBank[27] <= 32'b0;
					 registerBank[28] <= 32'b0;
					 registerBank[29] <= 32'b0;
					 registerBank[30] <= 32'b0;
					 registerBank[31] <= 32'b0;
        end else if (reg_write) begin
            registerBank[reg_to_write] <= data_to_write;
        end
    end

    always @(*) begin
        rd1 <= registerBank[rs];
        rd2 <= registerBank[rt];
    end

endmodule