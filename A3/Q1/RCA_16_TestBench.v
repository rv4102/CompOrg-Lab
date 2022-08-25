`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 3
// Question 1
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module RCA16_TB;
    // Inputs
    reg[15:0] A;
    reg[15:0] B;
    reg cin;

    // Outputs
    wire[15:0] sum;
    wire cout;

    RCA_16 A1(.A(A), .B(B), .cin(cin), 
            .sum(sum), .cout(cout));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, cin = %b, sum = %d, cout = %b\n", A, B, cin, sum, cout);

            // Test cases
            // 16-bit unsigned numbers can vary from [0, 65535]
            // Output can range from [0, 131071]
            A = 16'd65000; B = 16'd65340; cin = 1'd0;       // sum = 16'64804, cout = 1'd1
            #100;
            A = 16'd58135; B = 16'd3592; cin = 1'd0;        // sum = 16'61727, cout = 1'd0
            #100;
            A = 16'd1005; B = 16'd69; cin = 1'd1;           // sum = 16'd1075, cout = 1'd0
            #100;
            A = 16'd15124; B = 16'd5383; cin = 1'd1;        // sum = 16'20508, cout = 1'd0
            #100;
            A = 16'd50; B = 16'd10024; cin = 1'd0;          // sum = 16'd10074, cout = 1'd0
        end

endmodule