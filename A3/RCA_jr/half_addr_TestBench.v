`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module HalfAdderTB;
    // Inputs
    reg in1;
    reg in2;

    // Outputs
    wire sum;
    wire carry;

    half_addr H1(.in1(in1), .in2(in2), 
                .sum(sum), .carry(carry));
    
    initial 
        begin
            $monitor ("in1 = %d, in2 = %d, sum = %d, carry = %d\n", in1, in2, sum, carry);

            // Test cases
            in1 = 0; in2 = 0;
            #100;
            in1 = 0; in2 = 1;
            #100;
            in1 = 1; in2 = 0;
            #100;
            in1 = 1; in2 = 1;
        end

endmodule