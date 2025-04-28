module binary(
    input w,
    input clk,
    output z,
    output [2:0] state
);
    wire [2:0] Next;
    
    
    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .Q(state[0])
    );
    
    
    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .Q(state[1])
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .Q(state[2])
    );
    
    
   assign Next[2] = (~state[2] & w) | (state[0] & state[1] & w);
   assign Next[1] =  ((~state[2] & ~state[1] & state[0]) |
                     (~state[2] & state[1] & ~state[0]) |
                     (~state[2] & ~state[1] & ~state[0] & w));
                     
   assign Next[0] = (~state[0] & ~state[1] & ~w) |
                    (state[0] & state[1] & ~w) | 
                    (~state[1] & ~state[2] & w) | 
                    (~state[0] & ~state[2] & w);
             
   assign z = ((state == 2'b010) || (state === 3'b100));

endmodule

