# STARS 2023 Design Final Project

## Synthsugeons
* Bailey Vincer
* Jackson Liner
* Jahsiah Castillo
* Julia Scott
* (TA) Aidan Prendergast

## [Synth Surgeons: Synthesizer]
Our syntesizer is a 13 note full octave ranging from a low C to a high C each with unique frequencies. We have a button for mode toggling that enables the user to switch between 3 waveforms: sawtooth, triangle, square. There is also a button for sound toggling that mimics the function of a soundboard equipped with 2 unique sounds. Finally we have an active-low enable that allows the synthesizer to operate only when enable is on and an asynchronous active-low reset.

## Base Source Files
Clock and nRst omitted from input lists.
- keypad_encoder.sv              : Synchronizer, Priority Encoder and Edge Detector Module code here.
  - Inputs: [14:0] keypad_i
  - Outputs: [3:0] keypad_enc, modekey_edge, soundgen_edge
- freq_gen.sv                : Frequency Generator Look-Up Table module.
  - Inputs: enable, [3:0] keypad_enc
  - Outputs: [15:0] divider
- oscillator.sv                  : Oscillator module.
  - Inputs: enable, [15:0] divider
  - Outputs: [15:0] count
- sample_rate_clock_divider.sv   : Sample Rate Clock Divider module.
  - Inputs: enable
  - Outputs: flag
- sequential_divider.sv          : Sequential Divider module.
  - Inputs: enable, [15:0] divider, [15:0] count, flag
  - Outputs: [7:0] quotient
- waveshaper.sv                  : Waveshaper module.
  - Inputs: [7:0] quotient, flag
  - Outputs: [7:0] sample
- pwm.sv                         : PWM Conversion module.
  - Inputs: enable, [7:0] sample
  - Outputs: pwm_o
- mode_fsm.sv                    : Wave Mode Controller FSM module.
  - Inputs: modekey_edge
  - Outputs: [1:0] mode
- soundgen_fsm.sv                : Soundgen Controller FSM module.
  - Inputs: soundgen_edge
  - Outputs: [3:0] soundgen_note

## Testbenching
- tb_synth.sv : This is the test bench used to test your design.
- tb_sequential_div.sv: This test bench was used to test the sequential divider.
- tb_pwm.sv: This test bench was used to test the pulse wave modulation module. 
- tb_oscillator.sv: This test bench was used to test the oscillator, or frequency generator.
  

## Pin Layout
Put all the GPIO pin numbers, i/o/io determination, and labels

## Supporting Equipment
List all the required equipment and upload a breadboard with the equipment set up (recommend using tinkercad circuits if possible)

## RTL Diagrams
All the stuff from the proposal goes here, obviously updated from the time you did the proposal to the final layout
Include more than just block diagrams, including sub-block diagrams, state-transition diagrams, flowcharts, and timing diagrams

# Deadlines and Events
### Monday June 19th: Design Review Presentations
  
  Present top-level and block-level diagrams to explain design function and timing behavior.
<br><b>Requirements:</b> Heirarchical RTL Diagrams, State Transition Diagrams, Flowcharts, Pseudocode in RTL, WaveDROM for timing specific blocks.
<br><b>Notes:</b> Share the presentation with instructors in advance.

### Friday, June 23rd: Feature Freeze and Integration Mark

  Complete individual blocks to the level of error-free synthesis and passing testbenches. Begin top level module creation, integration, and testing.
<br><b>Requirements:</b> Transcript of Passing Testbench Cases for each tested module, Organized GTKWave showcase of passing test cases.
<br><b>Notes:</b> Beautify GTKWave formatting for ease of demonstration.

### Monday, July 3rd: Final Design Presentations

## Some Legal Statement
From Purdue that I haven't figured out yet, maybe some stuff about Dr. J, the program, and other instructors
