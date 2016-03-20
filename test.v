module test
(
    input button,
    input clk,
    output led1,
    output led2,
    output led3
);
    //assign led1 = button;
    //assign led2 = ~button;
    //assign led3 = clk;

    /* reg */
    reg [32:0] counter;
    //reg state;

    /* assign */
    //assign led1 = state;
    assign led2 = 1'b1;
    assign led3 = 1'b1;

    /* always */
    always @ (posedge clk) begin
        if (!button)
        begin
            counter <= counter + 1;
            led1 <= counter[26]; // <------ data to change
        end
        else
            state <= 1'b1;
    end

endmodule
