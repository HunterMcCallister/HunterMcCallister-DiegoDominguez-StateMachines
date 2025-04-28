
module top(
    input sw,
    output [9:0] led,
    input btnC

);


one_hot onehot(
    .w(sw),
    .clk(btnC),
    .z(led[0]),
    .state(led[6:2])
);


binary binarymodule(
    .w(sw),
    .clk(btnC),
    .z(led[1]),
    .state(led[9:7])
);
endmodule


