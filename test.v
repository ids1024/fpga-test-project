module test
(
    input button,
    input clk,
    output reg led1,
    output led2,
    output led3
);

    reg [32:0] counter;

    assign led2 = 1'b1;
    assign led3 = 1'b1;

    always @ (posedge clk) begin
        counter <= counter + 1;
        led1 <= counter[26];
    end

endmodule
