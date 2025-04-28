module dff(
    input clk,       // Clock signal (btnC)
    input d,         // Data input (sw[0])
    output reg q,         // Q output (led[0])
    output nq        // Inverted Q (led[1])
);
    // Initialize q to 0 for simulation purposes
    initial begin
    q <= 0;
    end 
   
    
    // On rising clock edge or asynchronous reset, update q
    always @(posedge clk) begin
            q <= d;
    end
    
    assign nq = ~q;
endmodule




