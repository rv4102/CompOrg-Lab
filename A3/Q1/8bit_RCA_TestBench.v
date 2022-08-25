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
    reg[7:0] A;
    reg[7:0] B;
    reg cin;

    // Outputs
    wire[7:0] sum;
    wire cout;

    RCA_8 A1(.A(A), .B(B), .cin(cin), 
                .sum(sum), .cout(cout));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, cin = %d, sum = %d, cout = %d\n", A, B, cin, sum, cout);

            // Test cases
            // 8-bit unsigned numbers can vary from [0, 256]
            // Output can range from [0, 512]
            A = 8'd120; B = 8'd240; cin = 1'd0;     // sum = 8'd104, cout = 1'd1
            #100;
            A = 8'd169; B = 8'd256; cin = 1'd1;     // sum = 8'd170, cout = 1'd1
            #100;
            A = 8'd53; B = 8'd250; cin = 1'd0;      // sum = 8'd47, cout = 1'd1
            #100;
            A = 8'd1; B = 8'd50; cin = 1'd1;        // sum = 8'd50, cout = 1'd0
            #100;
            A = 8'd50; B = 8'd100; cin = 1'd0;      // sum = 8'd150, cout = 1'd0
        end

endmodule