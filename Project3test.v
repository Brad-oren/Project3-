module Project3test(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);


reg reset = 0;
reg right = 0;




wire[2:0] state;
wire[2:0] Lcba;
wire[2:0] Rabc;
wire clock1;




//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================


clock_divider #(10) u0 (.clk(ADC_CLK_10),.reset_n(KEY[0]),.outclk(clock1)); 






always @(negedge KEY[1])
	right <= ~right;

always @(negedge KEY[0])
	reset <= ~reset;





tailLightStateMachine f1(.clk(clock1),.reset(reset),.hazard(SW[0]),.left(SW[1]),.right(right),.Lcba(Lcba),.Rabc(Rabc),.state(state));
tailLightdimmer d1(.dimclk(clock1),.Lcba(Lcba),.Rabc(Rabc),.Lc(LEDR[9]),.Lb(LEDR[8]),.La(LEDR[7]),.Ra(LEDR[2]),.Rb(LEDR[1]),.Rc(LEDR[0]));
sev_seg1 s1(.data(state), .display(HEX0));
sev_seg2 s2(.data(state), .display(HEX1));

assign HEX2 = 8'b11111111;
assign HEX3 = 8'b11111111;
assign HEX4 = 8'b11111111;
assign HEX5 = 8'b11111111;

endmodule
