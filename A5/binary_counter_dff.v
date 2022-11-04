`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 5
// Question 1a
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module binary_counter(input wire clk, input wire rst, output wire[3:0] count);
    dff d0(clk, 1'b0, count[0]);
    dff d1(clk, 1'b0, count[1]);
    dff d2(clk, 1'b0, count[2]);
    dff d3(clk, 1'b0, count[3]);

    always @(posedge clk, posedge rst) begin
        if(rst == 1)
            count <= 0;     // set count to 0 if reset is pressed
        else if(count == 4'b1111)
            count <= 0;     // set count to 0 if count reaches 1111
        else
            count <= count + 1;
    end
endmodule