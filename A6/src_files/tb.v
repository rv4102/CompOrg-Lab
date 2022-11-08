`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 6
// Group 69
// Team Member 1: Rushil Venkateswar (20CS30045)
// Team Member 2: Jatin Gupta (20CS10087)
// SEM 5 (Autumn 2022-23)
//////////////////////////////////////////////////////////////////////////////////

module tb;
    reg clk;
    reg rst;

    top_module kgprisc(.clk(clk), .rst(rst));
    
    initial begin
        clk = 0;
        rst = 1;

        #5 rst = 0;

        #2095
        $display("Content in register 19: %d", kgprisc.dp.rf.registerBank[19]);
        if(kgprisc.dp.rf.registerBank[19] == -1) begin
            $display("element not found");
        end else begin
            $display("Element found at index: %d", kgprisc.dp.rf.registerBank[19]))
        end
        $finish;
    end

    always begin
        #10 clk = ~clk;
    end
endmodule