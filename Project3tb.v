`timescale 1ns / 100ps

module Project3tb();


reg clock_not;
reg clock_not2;
reg mainclock_r;
reg [1:0] KEY;
reg [9:0] SW;

wire [9:0]LED;
wire [7:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;

Project3test a1(
	//////////// CLOCK //////////
			          		.ADC_CLK_10(mainclock_r),
	 		          		.MAX10_CLK1_50(clock_not),
			          		.MAX10_CLK2_50(clock_not2),

	//////////// SEG7 //////////
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5),
	//////////// KEY //////////
	.KEY(KEY),

	//////////// LED //////////
	.LEDR(LED),

	//////////// SW //////////
	.SW(SW)
	);


always
begin
  #5 mainclock_r = ~mainclock_r;
  end

  initial 
  begin
  mainclock_r = 0; KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 0; 


#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //1000
#1000  KEY[0] = 0; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //2000
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //3000
#1000  KEY[0] = 0; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //4000
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //5000


#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //6000
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //7000
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 0; //8000

#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 0; // Turn off hazard


#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //Turn on left turn
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //Turn on left turn
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //Turn on left turn
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //Turn on left turn




#1000  KEY[0] = 1; KEY[1] = 1; SW[0] = 0; SW[1] = 1; //turn on right turn


#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 0; SW[1] = 1; //


#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //show hazard has priority
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //show hazard has priority
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //show hazard has priority
#1000  KEY[0] = 1; KEY[1] = 0; SW[0] = 1; SW[1] = 1; //
  
#500 $finish;

end

initial
begin
    $dumpfile("projectout.vcd");
    $dumpvars;
end

initial
	$monitor($time, " clock = %b reset_n = %b Hazard = %b  Right_turn_Button =%b turn_signal = %b L1 = %b  L2 = %b L3 = %b R1 = %b  R2 = %b R3 = %b", mainclock_r , KEY[0], SW[0], KEY[1], SW[1], LED[7], LED[8], LED[9],LED[2],LED[1],LED[0]);


endmodule