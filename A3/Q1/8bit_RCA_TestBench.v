`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA8_TB;
    // Inputs
    reg in1;
    reg in2;
    reg cin;

    // Outputs
    wire sum;
    wire carry;

    full_addr F1(.in1(in1), .in2(in2), .cin(cin), 
                .sum(sum), .carry(carry));
    
    initial 
        begin
            $monitor ("in1 = %d, in2 = %d, cin = %d, sum = %d, carry = %d\n", in1, in2, cin, sum, carry);

            // Test cases
            in1 = 0; in2 = 0; cin = 0;
            #100;
            in1 = 0; in2 = 0; cin = 1;
            #100;
            in1 = 0; in2 = 1; cin = 0;
            #100;
            in1 = 0; in2 = 1; cin = 1;
            #100;
            in1 = 1; in2 = 0; cin = 0;
            #100;
            in1 = 1; in2 = 0; cin = 1;
            #100;
            in1 = 1; in2 = 1; cin = 0;
            #100;
            in1 = 1; in2 = 1; cin = 1;
        end

endmodule