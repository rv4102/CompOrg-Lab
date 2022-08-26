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
    reg[31:0] A;
    reg[31:0] B;
    reg cin;

    // Outputs
    wire[31:0] sum;
    wire cout;

    RCA_32 A1(.A(A), .B(B), .cin(cin), 
            .S(sum), .cout(cout));
    
    initial 
        begin
            $monitor ("A = %d, B = %d, cin = %b, sum = %d, cout = %b\n", A, B, cin, sum, cout);

            // Test cases
            // 32-bit unsigned numbers can vary from [0, 4294967295]
            // Output can range from [0, 8589934591]
            A = 32'd4294967290; B = 32'd4294967294; cin = 1'd0;     //sum = 32'd4294967288, cout = 32'd1    
            #100;
            A = 32'd1; B = 32'd4294967295; cin = 1'd0;              //sum = 32'd0, cout = 32'd1
            #100;
            A = 32'd1005; B = 32'd69; cin = 1'd1;                   //sum = 32'd1075, cout = 32'd0
            #100;
            A = 32'd151242; B = 32'd53831224; cin = 1'd1;           //sum = 32'd53982466, cout = 32'd0
            #100;
            A = 32'd501; B = 32'd5002423; cin = 1'd0;               //sum = 32'd5002924, cout = 32'd0
        end

endmodule