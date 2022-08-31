`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 2
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module wrapper_CLA_4_augmented(input clk, input rst,input[3:0] A, input[3:0] B, input cin,  
                    output reg[3:0] S, output reg p, output reg g);

reg [3:0] A_reg;
reg [3:0] B_reg;
reg cin_reg;
wire [3:0] S_net;
wire p_net;
wire g_net;

always @(posedge clk)
    begin
        if(rst)
            begin
                A_reg<=4'd0;
                B_reg<=4'd0;
					 cin_reg<=1'd0;
					 S<=4'd0;
					 p<=1'd0;
					 g<=1'd0;
            end
        else
            begin
                A_reg<=A;
                B_reg<=B;
					 cin_reg<=cin;
					 S<=S_net;
					 p<=p_net;
					 g<=g_net;
            end
    end

bit_4_augment A1(A_reg, B_reg, cin_reg, S_net, p_net, g_net);

endmodule

