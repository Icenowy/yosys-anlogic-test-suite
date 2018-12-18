module test(
	input clk,
	input enable,
	input reset,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output h,
	output i,
	output j,
	output k,
	output l,
	output m,
	output n
);

reg dff_p, dff_n;

reg dffe_pp, dffe_pn, dffe_np, dffe_nn;

reg dff_pp0, dff_pp1, dff_pn0, dff_pn1;
reg dff_np0, dff_np1, dff_nn0, dff_nn1;

always @(posedge clk) begin
	dff_p = ~dff_p;
	if (enable)
		dffe_pp = ~dffe_pp;
	if (!enable)
		dffe_pn = ~dffe_pn;
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		dff_pp0 = 0;
		dff_pp1 = 1;
	end else begin
		dff_pp0 = ~dff_pp0;
		dff_pp1 = ~dff_pp1;
	end
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		dff_pn0 = 0;
		dff_pn1 = 1;
	end else begin
		dff_pn0 = ~dff_pn0;
		dff_pn1 = ~dff_pn1;
	end
end

always @(negedge clk) begin
	dff_n = ~dff_n;
	if (enable)
		dffe_np = ~dffe_np;
	if (!enable)
		dffe_nn = ~dffe_nn;
end

always @(negedge clk or posedge reset) begin
	if (reset) begin
		dff_np0 = 0;
		dff_np1 = 1;
	end else begin
		dff_np0 = ~dff_np0;
		dff_np1 = ~dff_np1;
	end
end

always @(negedge clk or negedge reset) begin
	if (!reset) begin
		dff_nn0 = 0;
		dff_nn1 = 1;
	end else begin
		dff_nn0 = ~dff_nn0;
		dff_nn1 = ~dff_nn1;
	end
end

assign a = dff_p;
assign b = dff_n;
assign c = dffe_pp;
assign d = dffe_pn;
assign e = dffe_np;
assign f = dffe_nn;
assign g = dff_pp0;
assign h = dff_pp1;
assign i = dff_pn0;
assign j = dff_pn1;
assign k = dff_np0;
assign l = dff_np1;
assign m = dff_nn0;
assign n = dff_nn1;

endmodule
