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

keypad_encoder.sv : Synchronizer, Priority Encoder and Edge Detector Module code here.
  Inputs: [14:0] keypad_i
  Outputs: [3:0] keycode, mode_key, sound_edge
frequency_divider.sv : Frequency Generator Look-Up Table module.
  Inputs: enable, [3:0] keycode, sound_series
  Outputs: [15:0] divider
oscillator.sv : Oscillator module.
  Inputs: enable, [15:0] divider
  Outputs: [15:0] count
clock_div.sv : Sample Rate Clock Divider module.
  Inputs: enable
  Outputs:sample_now
sequential_divider.sv : Sequential Divider module.
  Inputs: enable, sample_now, [15:0] divider, [15:0] count
  Outputs: [7:0] quotient
waveshaper.sv : Waveshaper module.
  Inputs: [7:0] quotient, wave_seleect
  Outputs: [7:0] sample
pwm.sv : PWM Conversion module.
  Inputs: enable, [7:0] sample
  Outputs: pwm_o
mode_fsm.sv : Wave Mode Controller FSM module.
  Inputs: mode_key
  Outputs: [1:0] wave_select
soundgen_fsm.sv : Soundgen Controller FSM module.
  Inputs: soundgen_edge
  Outputs: [3:0] sound_series

## Testbenching
- tb_synth.sv : This is the test bench used to test your design.
- tb_sequential_div.sv: This test bench was used to test the sequential divider.
- tb_pwm.sv: This test bench was used to test the pulse wave modulation module. 
- tb_oscillator.sv: This test bench was used to test the oscillator, or frequency generator.
  

## Pin Layout

Clock (I): Timing components
Reset(I): Resets output supply when active low
Keys [12:0] (I): 13 buttons assigned to each of the 13 notes in one middle-range octave
Mode [13] (I): 1 button that toggles 3 waveforms
Sound_series [14] (I): 1 button that toggles 2 pre-programmed sounds
pwm_o [15] (O): System output that connects to speakers

Total I/O pins: 16

## Supporting Equipment
speaker, amplifier, low-pass filter

## RTL Diagrams
All the stuff from the proposal goes here, obviously updated from the time you did the proposal to the final layout
Include more than just block diagrams, including sub-block diagrams, state-transition diagrams, flowcharts, and timing diagrams

Flowchart

![flowchart](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/f0ff4102-c071-4939-adfe-001c8f36d0e8)

Main RTL

![RTL_main](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/f2f418dd-1152-48c8-a39e-a9dd90275d47)

Keypad Encoder

![keypad_encoder](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/47c6f2a9-8494-4042-864c-158b86bd1d06)

Frequency Divider 

![RTL_freq_div](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/81034e0c-ccb3-488e-8595-509172016e37)

Oscillator

![oscillator](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/f232afd4-477d-4235-8390-e24140fac557)

Sequential Divider

![RTL_sequential_div](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/e926f827-160a-409a-b59f-b3d8207102c0)

Timing and State Diagrams

![timing_and_state](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/32993f3d-a795-44c2-be84-9c18f7dbce35)

Wave Shaper

![wave_shaper](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/3f77870c-2129-4335-a919-94a7a485853e)

Clock Divider

![RTL_clock_div](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/f376f021-0ec4-42d7-9ff1-2232053d2200)

PWM

![PWM](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/9a4fe96f-b5b7-4b2d-984b-8bbde40f5887)

FSM

![fsm](https://github.com/STARS-Design-Track-2023/synthsurgeons/assets/75226287/e70bb433-3284-487e-95e2-45f6ace6540e)


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
