`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module bit_4_augment_TB;
    // Inputs
    reg[3:0] A;
    reg[3:0] B;
    reg cin;

    // Outputs
    wire[3:0] sum;
    wire p;
    wire g


    bit_4_augment A1(.A(A), .B(B), .cin(cin), 
                .S(sum), .p(p), .g(g));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, cin = %b, sum = %d, p = %d, g = %d\n", A, B, cin, sum, p, g);

            // Test cases
            // 4-bit unsigned numbers can vary from [0, 15]
            
            A = 4'd5; B = 4'd6; cin = 1'd0;     
            #100;
            A = 4'd3; B = 4'd2; cin = 1'd1;    
            #100;
            A = 4'd5; B = 8'd2; cin = 1'd0;      
            #100;
            A = 4'd0; B = 4'd14; cin = 1'd1;        
            #100;
            A = 4'd1; B = 4'd15; cin = 1'd0;      
        end

endmodule