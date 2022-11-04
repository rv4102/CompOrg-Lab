`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module shift_module (input [31:0] A, input [31:0] shamt, input is_left, input is_arithmetic, output reg [31:0] out);

    always @(*) begin
        if(is_arithmetic) begin
            if(!is_left) begin
                out = in >>> shamt;
            end else begin
                out = in
            end
        end else begin
            if(!is_left) begin
                out = in >> shamt
            end else begin
                out = in << shamt;
            end
        end
    end

endmodule
