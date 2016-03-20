module test
(
button,
led1,
led2,
led3,
clk
);


input button;
input clk;
output led1;
output led2;
output led3;

//assign led1 = button;
//assign led2 = ~button;
//assign led3 = clk;

reg led3;


/* reg */
reg data1 = 1'b1;
reg [32:0] counter;
reg state;

/* assign */
assign led1 = state;
assign led2 = data1;

/* always */
always @ (posedge clk) begin
counter <= counter + 1;
state <= counter[26]; // <------ data to change
end

endmodule
