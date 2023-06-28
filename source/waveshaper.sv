`default_nettype none
module waveshaper (
    // HW
    input logic [7:0] quotient, input logic [1:0] mode,
    output logic [7:0] sample
);

logic [8:0] lquotient;
assign lquotient = {quotient, 1'b0};
logic [9:0] squotient;
assign squotient = {10'd512 - {quotient, 1'b0}};

always_comb begin 
  case(mode)
  2'b00 : sample = quotient;
  2'b01 : sample = (quotient >= 128 ? lquotient[7:0]: squotient[7:0]);
  2'b10 : sample = (quotient >= 128 ? 255 : 0);
  2'b11 : sample = 0;
  endcase  
end


endmodule