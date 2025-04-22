module sequential_multiplier (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [15:0] p = 0,
    output reg done = 0
);

// Pipelined registers
reg [7:0] multiplicand [0:1];
reg [7:0] multiplier [0:1];
reg [15:0] product [0:1];
reg [3:0] counter [0:1];
reg running [0:1];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Initialize all pipeline stages
        multiplicand[0] <= 8'b0;
        multiplier[0] <= 8'b0;
        product[0] <= 16'b0;
        counter[0] <= 4'b0;
        running[0] <= 1'b0;
        
        multiplicand[1] <= 8'b0;
        multiplier[1] <= 8'b0;
        product[1] <= 16'b0;
        counter[1] <= 4'b0;
        running[1] <= 1'b0;
        
        done <= 1'b0;
        p <= 16'b0;
    end else begin
        // Pipeline stage 1
        running[1] <= running[0];
        counter[1] <= counter[0];
        
        if (running[0]) begin
            if (multiplier[0][0]) begin
                product[1] <= product[0] + {8'b0, multiplicand[0]};
            end else begin
                product[1] <= product[0];
            end
            
            multiplier[1] <= multiplier[0] >> 1;
            multiplicand[1] <= multiplicand[0] << 1;
        end
        
        // Pipeline stage 0 (input stage)
        done <= 1'b0;
        
        if (start && !running[0] && !running[1]) begin
            multiplicand[0] <= a;
            multiplier[0] <= b;
            product[0] <= 16'b0;
            counter[0] <= 4'b0;
            running[0] <= 1'b1;
        end else if (running[0]) begin
            counter[0] <= counter[0] + 1;
            
            if (counter[0] == 4'd6) begin
                running[0] <= 1'b0;
            end
        end
        
        // Output stage
        if (counter[1] == 4'd7) begin
            done <= 1'b1;
            p <= product[1];
        end
    end
end

endmodule