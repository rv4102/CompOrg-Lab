`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////


module dff(input wire clk,input reset, input wire d, output reg q);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else 
            q <= d;
    end

endmodule