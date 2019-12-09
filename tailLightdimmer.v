module tailLightdimmer(dimclk,lights,Lcba,Rabc,Lc,Lb,La,Ra,Rb,Rc);
input dimclk, lights;
input[2:0] Lcba, Rabc;
output reg Lc, Lb, La, Ra, Rb, Rc;
 reg toggle;              
 always@(posedge dimClk ) begin
 if(lights) begin
 toggle <= ~toggle;
 
 if(Lcba[2]) begin
 Lc = 1'b1;
 end
 else begin
 Lc = toggle;
 end
 
 if(Lcba[1]) begin
 Lb = 1'b1;
 end
 else begin
 Lb = toggle;
 end
 
 if(Lcba[0]) begin
 La = 1'b1;
 end
 else begin
 La = toggle;
 end
 
 if(Rabc[1]) begin
 Ra = 1'b1;
 end
 else begin
 Ra = toggle;
 end
 
 if(Rabc[1]) begin
 Rb = 1'b1;
 end
 else begin
 Rb = toggle;
 end
 
 if(Rabc[0]) begin
 Rc = 1'b1;
 end
 else begin
 Rc = toggle;
 end
 
 end
 else begin
 Lc = Lcba[2];
 Lb = Lcba[1];
 La = Lcba[0];
 Ra = Rabc[2];
 Rb = Rabc[1];
 Rc = Rabc[0];
 end
 end
 endmodule