module test(
	input clk,
	output a
);

reg r = 1;

always @(posedge clk)
	r = ~r;

assign a = r;

endmodule
