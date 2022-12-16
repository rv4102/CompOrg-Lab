`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module program_counter(input [31:0] nextinstr, input clk, input rst, output reg [31:0] intraddr);

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            intraddr <= -32'd4;
        end else begin
            intraddr <= nextinstr;
        end
    end
endmodule