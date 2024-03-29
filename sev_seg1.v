module sev_seg1(data, display);
input [2:0] data;
output reg [7:0]display;


always @(*)
 begin
    case(data[2:0])
    3'b000 : display = 8'b10001110; // f
    3'b001 : display = 8'b11111001;// 1
    3'b010 : display = 8'b10100100; //2
    3'b011 : display = 8'b10110000; //3 
    3'b100 : display = 8'b11111001; //1
    3'b101 : display = 8'b10100100; //2
    3'b110 : display = 8'b10110000; //3
    3'b111 : display = 8'b10001001; //h
   
    endcase
    
end

endmodule
