`timescale 1ns / 100ps

module toptb();

reg clock_r;
reg reset_n_r;
wire [3:0] tens, ones;

module Project3

    //////// clock ///////
    reg 		          		ADC_CLK_10,
    reg 		          		MAX10_CLK1_50,
    reg 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	wire		     [7:0]	  HEX0,
	wire	       [7:0]		HEX1,
  wire		     [7:0]	  HEX2,
	wire         [7:0]		HEX3,
	wire		     [7:0]		HEX4,
	wire		     [7:0]		HEX5,

	//////////// KEY //////////
	reg 		     [1:0]		KEY,

	//////////// LED //////////
	wire		     [9:0]		LEDR,

	//////////// SW //////////
	reg 		     [9:0]		SW
);

Project3 a1(.dimclk(dimclk), .lights(lights), .clk(clk), .reset(reset), .brake(brake), .hazards(hazards), .left(left), .right(right), .Lc(Lc), .Lb(Lb), .La(La), .Ra(Ra), .Rb(Rb), Rc(Rc))

