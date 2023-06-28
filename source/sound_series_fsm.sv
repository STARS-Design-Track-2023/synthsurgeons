module sound_series_fsm(
input logic sound_edge, clkdiv, n_rst, clk,
output logic [3:0] note_out
);

typedef enum logic [3:0] {base,n1,n2,n3,n4,n5,n6,n7,n8} state_note;
typedef enum logic {off,sound1} state_sound;

logic [3:0] note, next_note;
logic sound, next_sound, s1_on;

always_comb begin

case(sound)
  off: next_sound = sound_edge ? sound1:off;
  sound1: next_sound = sound_edge ? off:sound1;
  default next_sound = off;
endcase

if(sound == sound1)
  s1_on = 1;
else
  s1_on = 0;

// Next-State
case(note)
  base: next_note = s1_on ? n1:base;
  n1: next_note = clkdiv ? n2:n1;
  n2: next_note = clkdiv ? n3:n2;
  n3: next_note = clkdiv ? n4:n3;
  n4: next_note = clkdiv ? n5:n4;
  n5: next_note = clkdiv ? n6:n5;
  n6: next_note = clkdiv ? n7:n6;
  n7: next_note = clkdiv ? n8:n7;
  n8: next_note = clkdiv ? base:n8;
  default next_note = base;
endcase

// Output Logic
case(note)
  base: note_out = 4'b1111; //invalid
  n1: note_out = 4'b0000; //C(low)
  n2: note_out = 4'b0010; //D
  n3: note_out = 4'b0100; //E
  n4: note_out = 4'b0101; //F
  n5: note_out = 4'b0111; //G
  n6: note_out = 4'b1001; //A
  n7: note_out = 4'b1011; //B
  n8: note_out = 4'b1100; //C(high)
  default note_out = 4'b1111;
endcase

end

always_ff @ (posedge clk, negedge n_rst) begin
if (n_rst == 1'b0)
  note <= base;
else
  note <= next_note;
end

always_ff @ (posedge clk, negedge n_rst) begin
if (n_rst == 1'b0)
  sound <= off;
else
  sound <= next_sound;
end

endmodule