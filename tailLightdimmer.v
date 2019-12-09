module tailLightdimmer(input dimclk,input,lights,input[2:0] Lcba,input[2:0] Rabc,output reg Lc, output reg Lb, output reg La, output reg Ra,output reg Rb, output reg Rc);

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