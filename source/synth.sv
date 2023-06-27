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

endmodule

module synth_top (input logic [14:0] keypad_i, input logic clk, nrst, output logic pwm_o);

/* insert keypad encoder port line*/

logic [3:0] keycode, sound_series;
logic mode_key, signal;

mode_fsm  mode_fsm (.clk, .n_rst);

logic modekey_edge; 
logic [1:0] mode, next_mode;

frequency_divider freq_div (.keycode(pb[3:0]),.is_FPGA(pb[19]),.sound_series(pb[15:12]), .en(pb[18]), .divider({left,right}));

logic [15:0] divider;

/* insert sound series FSM port line*/
/* insert variables related to sound series*/
oscillator osc (.clk,.nrst, .en(pb[18]));

logic [15:0] count;

sequential_div seq_div (.clk, .nrst);

logic [2:0] next_count,count_div;
logic div, done, load;
logic [23: 0] R, next_r;
logic [7:0] Q, next_q, next_q_out;
logic [15:0] D, next_d, D_count, dividend;

waveshaper waveshaper (/* idk what to put for  this port line, no clock or reset*/)

logic [1:0] mode,
logic [7:0] sample, quiotient;

pwm pwm (.clk, .n_rst, /*pwm_o...is this variable supposed to be assigned to something on the FPGA board?*/)

logic [7:0] sample;

endmodule