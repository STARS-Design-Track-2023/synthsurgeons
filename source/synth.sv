`default_nettype none

module top 
(
  // I/O ports
  input  logic hz12M, reset,
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue,

  // UART ports
  output logic [7:0] txdata,
  input  logic [7:0] rxdata,
  output logic txclk, rxclk,
  input  logic txready, rxready
);

synth_top U1 (.keys(pb[12:0]), .modekey(pb[14]), .sound_edge(pb[15]), .en(pb[18]), .is_FPGA(pb[19]), .clk, .n_rst); 

endmodule

module synth_top (input logic [14:0] keypad_i, input logic clk, n_rst, output logic pwm_o);

keypad_encoder keypad_encoder (.keys(pb[12:0]), .modekey(pb[14]), .sound_edge(pb[15]), .clk, .n_rst);
logic [12:0] keys;
logic [3:0] out, keycode, sound_series;
logic mode_edge,sound_edge;

mode_fsm  mode_fsm (.clk, .n_rst);

logic modekey_edge; 
logic [1:0] mode, next_mode;

frequency_divider freq_div (.is_FPGA(pb[19]),.en(pb[18]));

logic [15:0] divider;

sound_series_fsm sound_series_fsm (.n_rst, .clk);

logic [3:0] note_out

oscillator osc (.clk,.n_rst, .en(pb[18]));

logic [15:0] count;


clock_div clock_div (.clk, .n_rst, .en(pb[18]));

logic flag;

sequential_div seq_div (.clk, .n_rst);

logic [2:0] next_count,count_div;
logic div, done, load;
logic [23: 0] R, next_r;
logic [7:0] Q, next_q, next_q_out;
logic [15:0] D, next_d, D_count, dividend;

waveshaper waveshaper (/* idk what to put for  this port line, no clock or reset*/)

logic [7:0] sample, quiotient;

pwm pwm (.clk, .n_rst, /*pwm_o...is this variable supposed to be assigned to something on the FPGA board?*/)

endmodule