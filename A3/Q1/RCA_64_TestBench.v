`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA32_TB;
    // Inputs
    reg[63:0] A;
    reg[63:0] B;
    reg cin;

    // Outputs
    wire[63:0] sum;
    wire cout;

    RCA_64 A1(.A(A), .B(B), .cin(cin), 
            .sum(sum), .cout(cout));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, cin = %b, sum = %d, cout = %b\n", A, B, cin, sum, cout);

            // Test cases
            // 64-bit unsigned numbers can vary from 0 to 1.8446744e+19

            A = 64'd4294967290234234234; B = 64'd42949672942342322; cin = 1'd0;       
            #100;
            A = 64'd0; B = 64'd92949672951231231; cin = 1'd0;        
            #100;
            A = 64'd1005; B = 64'd69; cin = 1'd1;          
            #100;
            A = 64'd151242; B = 64'd53831224; cin = 1'd1;        
            #100;
            A = 64'd501; B = 64'd5002423; cin = 1'd0;          
        end

endmodule