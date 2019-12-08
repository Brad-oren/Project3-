module clock_divider(clk, reset_n, outclk);

parameter divider = 0;

output reg outclk;
input clk;
input reset_n;


reg [27:0] counter;



always @(posedge clk or negedge reset_n)
begin
    if(reset_n == 0)
    begin
        counter <= 0;
        outclk <= 1'b0;
    end
else if (counter != divider)
    counter <= counter + 1;
        else
        begin
            outclk <= ~outclk;
            counter <= 0;
        end
    end

endmodule
