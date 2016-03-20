module test
(
button,
led1,
led2,
led3
);


input button;
output led1;
output led2;
output led3;

assign led1 = button;
assign led2 = ~button;

endmodule