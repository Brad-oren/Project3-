module tailLightdimmer(dimclk,Lcba,Rabc,Lc,Lb,La,Ra,Rb,Rc);
input dimclk;
input[2:0] Lcba, Rabc;
output reg Lc, Lb, La, Ra, Rb, Rc;
             
 always@(posedge dimclk ) begin

 Lc = Lcba[2];
 Lb = Lcba[1];
 La = Lcba[0];
 Ra = Rabc[2];
 Rb = Rabc[1];
 Rc = Rabc[0];

 end
 endmodule