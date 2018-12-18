module test(
	input [3:0]waddr,
	input [7:0]wdata,
	input wclk,
	input we,
	input [3:0]raddr,
	output [7:0]rdata
);

reg [7:0]ram[0:15];

initial begin
	ram[0] <= 0;
	ram[1] <= 1;
	ram[2] <= 2;
	ram[4] <= 4;
end

assign rdata = ram[raddr];

always @(posedge wclk)
	if (we)
		ram[waddr] <= wdata;

endmodule
