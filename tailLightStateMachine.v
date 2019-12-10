
module tailLightStateMachine( clk, reset, hazard, left, right,  Lcba,  Rabc, state);
                
input clk, reset, hazard, left, right; 
output reg[2:0] Lcba, Rabc, state;


 `define state_off   4'd0
 `define state_l1   4'd1
 `define state_l2   4'd2
 `define state_l3   4'd3
 `define state_r1   4'd4
 `define state_r2   4'd5
 `define state_r3   4'd6
 `define state_hazard  4'd7          



 reg[3:0] currentState;         
 reg[3:0] nextState;            

  always@( * ) begin
 case(currentState)
 `state_off: begin
	Lcba = 3'b000;                      
	Rabc = 3'b000;
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
	`state_hazard: begin
	Lcba = 3'b111;
	Rabc = 3'b111;
	end
	endcase 
	end
 
 always@(*) begin          
 if(reset) currentState <= `state_off;
 else currentState <= nextState;
 end

 always@(posedge clk) begin            
 nextState = currentState;
  if(reset) begin                
  nextState = `state_off;
  end
   else if(!reset && !hazard && !left && !right) begin 
  nextState = `state_off;
  end
  else if(!reset && hazard && (currentState != `state_hazard)) begin      
   nextState = `state_hazard;           
   end 
    else if(!reset && hazard && (currentState == `state_hazard)) begin 
  nextState = `state_off;
  end
   
  else begin
  case (currentState)
	`state_off: begin              
	if(!reset && !hazard && left && !right) nextState = `state_l1;
	if(!reset && !hazard && left && right) nextState = `state_r1;
	end
	`state_l1: begin
	if(!reset && !hazard && left && !right) nextState = `state_l2;
	if(!reset && !hazard && left && right) nextState = `state_r1;
	end
	`state_l2: begin
	if(!reset && !hazard && left && !right) nextState = `state_l3;
	if(!reset && !hazard && left && right) nextState = `state_r1;
	end
	`state_l3: begin
	if(!reset && !hazard && left && !right) nextState = `state_off;
	if(!reset && !hazard && left && right) nextState = `state_r1;
	end
	`state_r1: begin
	if(!reset &&  !hazard && left && !right) nextState = `state_l1;
	if(!reset &&  !hazard && left && right) nextState = `state_r2;
	end
	`state_r2: begin
	if(!reset &&  !hazard && left && !right) nextState = `state_l1;
	if(!reset &&  !hazard && left && right) nextState = `state_r3;
	end
	`state_r3: begin
	if(!reset &&  !hazard && left && !right) nextState = `state_l1;
	if(!reset &&  !hazard && left && right) nextState = `state_off;	
	end
	`state_hazard: begin
	if(!reset &&  !hazard && left && !right) nextState = `state_l1;
	if(!reset &&  !hazard && left && right) nextState = `state_r1;
	end 
	  
	
	
	endcase  
	end   
	end

	always@(posedge clk) begin
		state <= currentState;
		end


	endmodule