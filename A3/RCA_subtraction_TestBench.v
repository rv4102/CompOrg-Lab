`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA_subTB;
    // Inputs
    reg signed[63:0] A;
    reg signed[63:0] B;

    // Outputs
    wire signed[63:0] diff;
    wire cout;

    RCA_sub A1(.A(A), .B(B), 
            .D(diff), .cout(cout));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, difference = %d\n", A, B, diff);

            // Test cases
            A = 16'd65000; B = 16'd65340;
            #100;
            A = 16'd58135; B = 16'd3592;
            #100;
            A = 16'd1005; B = 16'd69;   
            #100;
            A = 16'd15124; B = 16'd5383;
            #100;
            A = 16'd50; B = 16'd10024; 
        end

endmodule