module test
(
    input button,
    input clk,
    output led1,
    output led2,
    output led3
);

    reg [32:0] counter;

    assign led1 = counter[26];
    assign led2 = 1'b1;
    assign led3 = 1'b1;

    always @ (posedge clk) counter <= counter + 1;

endmodule
