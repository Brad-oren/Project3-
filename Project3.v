
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
module Complete(

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


reg reset;
reg right;

wire[2:0] Lcba;
wire[2:0] Rabc;
wire clock_1Hz;
//wire reg reset;
//wire right;
//wire left;


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================


clock_divider #(5_000_000) u0 (.clk(ADC_CLK_10),.reset_n(KEY[0]),.outclk(clock_1Hz)); 

always @(negedge KEY[0])
	reset <= ~reset;

always @(negedge KEY[1])
	right <= ~right;


tailLightStateMachine f1(.clk(clock1_Hz),.reset(reset),.hazard(SW[0]),.left(SW[1]),.right(right),.Lcba(Lcba),.Rabc(Rabc));
tailLightdimmer d1(.dimclk(clock1_Hz),.Lcba(Lcab),.Rabc(Rabc),.Lc(LEDR[9]),.Lb(LEDR[8]),.La(LEDR[7]),.Ra(LEDR[0]),.Rb(LEDR[1]),.Rc(LEDR[2]));

endmodule
