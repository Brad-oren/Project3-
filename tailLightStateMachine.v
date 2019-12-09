
module tailLightStateMachine( clk, reset,  brake, hazard,  left,  right,  Lcba,  Rabc);
                
input clk, reset, brake, hazard, left, right; 
output reg[2:0] Lcba, Rabc;


 `define state_off   4'd0
 `define state_brake   4'd1
 `define state_l1   4'd2
 `define state_l2   4'd3
 `define state_l3   4'd4
 `define state_r1   4'd5
 `define state_r2   4'd6
 `define state_r3   4'd7
 `define state_bl1   4'd8
 `define state_bl2   4'd9
 `define state_br1   4'd10
 `define state_br2   4'd11
 `define state_hazard  4'd12          



 reg[3:0] currentState;         
 reg[3:0] nextState;            

  always@( * ) begin
 case(currentState)
 `state_off: begin
	Lcba = 3'b000;                      
	Rabc = 3'b000;
	end
	`state_brake: begin
	Lcba = 3'b111;
	Rabc = 3'b111;
	end
	`state_l1: begin
	Lcba = 3'b001;
	Rabc = 3'b000;
	end
	`state_l2: begin
	Lcba = 3'b011;
	Rabc = 3'b000;
	end
	`state_l3: begin
	Lcba = 3'b111;
	Rabc = 3'b000;
	end
	`state_r1: begin
	Lcba = 3'b000;
	Rabc = 3'b100;
	end
	`state_r2: begin
	Lcba = 3'b000;
	Rabc = 3'b110;
	end
	`state_r3: begin
	Lcba = 3'b000;
	Rabc = 3'b111;
	end
	`state_bl1: begin
	Lcba = 3'b001;
	Rabc = 3'b111;
	end
	`state_bl2: begin
	Lcba = 3'b011;
	Rabc = 3'b111;
	end
	`state_br1: begin
	Lcba = 3'b111;
	Rabc = 3'b100;
	end
	`state_br2: begin
	Lcba = 3'b111;
	Rabc = 3'b110;
	end
	`state_hazard: begin
	Lcba = 3'b111;
	Rabc = 3'b111;
	end
	endcase 
	end
 
 always@(posedge clk) begin          
 if(reset) currentState <= `state_off;
 else currentState <= nextState;
 end
 
 always@( * ) begin            
 nextState = currentState;
  if(reset) begin                
  nextState = `state_off;
  end
  else if(!reset && brake && !left && !right) begin     
  nextState = `state_brake; 
  end
  else if(!reset && brake && left && right) begin     
  nextState = `state_brake;
  end
  else if(!reset && !brake && hazard && (currentState != `state_hazard)) begin      
   nextState = `state_hazard;           
   end 
   else if(!reset && !brake && !hazard && left && right && (currentState != `state_hazard)) begin  
   nextState = `state_hazard;            
   end
  else if(!reset && !brake && !hazard && !left && !right) begin 
  nextState = `state_off;
  end
  else begin
  case (currentState)
	`state_off: begin              
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_brake: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_l1: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_bl2;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l2;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_l2: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_brake;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l3;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_l3: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_r3;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_off;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_r1: begin
	if(!reset && brake && !left && right) nextState = `state_br2;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r2;
	end
	`state_r2: begin
	if(!reset && brake && !left && right) nextState = `state_brake;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r3;
	end
	`state_r3: begin
	if(!reset && brake && !left && right) nextState = `state_l3;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_off;
	end
	`state_bl1: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_bl2;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l2;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_bl2: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_brake;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l3;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	end
	`state_br1: begin
	if(!reset && brake && !left && right) nextState = `state_br2;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r2;
	end
	`state_br2: begin
	if(!reset && brake && !left && right) nextState = `state_brake;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r3;
	end
	`state_hazard: begin
	if(!reset && brake && !left && right) nextState = `state_br1;
	if(!reset && brake && left && !right) nextState = `state_bl1;
	if(!reset && !brake && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !brake && !hazard && !left && right) nextState = `state_r1;
	if(!reset && !brake && hazard) nextState = `state_off;
	if(!reset && !brake && !hazard && left && right) nextState = `state_off;
	end 
	  
	
	endcase  
	end   
	end
	endmodule