module keypad_encoder(
input logic [14:0] pb,
input logic [12:0] keys,
output logic [3:0] out,
output logic mode_edge,
output logic sound_edge
);
always_comb begin
casez (keys)
    13'b????????????1: out = 4'b0000; //C(low)
    13'b???????????10: out = 4'b0001; //C#
    13'b??????????100: out = 4'b0010; //D
    13'b?????????1000: out = 4'b0011; //D#
    13'b????????10000: out = 4'b0100; //E
    13'b???????100000: out = 4'b0101; //F
    13'b??????1000000: out = 4'b0110; //F#
    13'b?????10000000: out = 4'b0111; //G
    13'b????100000000: out = 4'b1000; //G#
    13'b???1000000000: out = 4'b1001; //A
    13'b??10000000000: out = 4'b1010; //A#
    13'b?100000000000: out = 4'b1011; //B
    13'b1000000000000: out = 4'b1100; //C(high)
    default: out = 4'b1111; //No valid output
endcase    
end

endmodule