module sev_seg2(data, display);
input [2:0] data;
output reg [7:0]display;


always @(*)
 begin
    case(data[2:0])
    3'b000 : display = 8'b11000000; // 0
    3'b001 : display = 8'b11110001; // L
    3'b010 : display = 8'b11110001; //L
    3'b011 : display = 8'b11110001; //L
    3'b100 : display = 8'b11001110; //R
    3'b101 : display = 8'b11001110; //R
    3'b110 : display = 8'b11001110; //R
    3'b111 : display = 8'b11111111; //blank
   
    endcase
    
end

endmodule
