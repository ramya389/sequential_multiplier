`timescale 1ns / 1ps

module tb_sequential_multiplier();

// Inputs
reg clk;
reg reset;
reg start;
reg [7:0] a;
reg [7:0] b;

// Outputs
wire [15:0] p;
wire done;

// Instantiate the Unit Under Test (UUT)
sequential_multiplier uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .p(p),
    .done(done)
);

// Clock generation (100 MHz)
always #5 clk = ~clk;

// Test cases
initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    start = 0;
    a = 0;
    b = 0;
    
    // Apply reset
    #20;
    reset = 0;
    #10;
    
    // Test Case 1: 5 × 7 = 35
    $display("Test Case 1: 5 × 7");
    a = 8'd5;
    b = 8'd7;
    start = 1;
    #10;
    start = 0;
    wait(done);
    if (p !== 16'd35) $error("5 × 7 = %d (Expected 35)", p);
    else $display("Success: 5 × 7 = %d", p);
    #20;
    
    // Test Case 2: 255 × 1 = 255
    $display("Test Case 2: 255 × 1");
    a = 8'd255;
    b = 8'd1;
    start = 1;
    #10;
    start = 0;
    wait(done);
    if (p !== 16'd255) $error("255 × 1 = %d (Expected 255)", p);
    else $display("Success: 255 × 1 = %d", p);
    #20;
    
    // Test Case 3: 128 × 2 = 256
    $display("Test Case 3: 128 × 2");
    a = 8'd128;
    b = 8'd2;
    start = 1;
    #10;
    start = 0;
    wait(done);
    if (p !== 16'd256) $error("128 × 2 = %d (Expected 256)", p);
    else $display("Success: 128 × 2 = %d", p);
    #20;
    
    // Test Case 4: Reset during operation
    $display("Test Case 4: Reset during operation");
    a = 8'd15;
    b = 8'd15;
    start = 1;
    #10;
    start = 0;
    #30; // Let it run for a few cycles
    reset = 1;
    #20;
    reset = 0;
    #20;
    
    $display("All test cases completed");
    $finish;
end
// In your testbench initial block:
// Increase wait time for done signal
wait(done);
#40; // Additional cycles for pipeline flush
endmodule