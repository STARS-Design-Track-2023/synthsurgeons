# STARS 2023 Design Final Project

## Synthsugeons
* Bailey Vincer
* Jackson Liner
* Jahsiah Castillo
* Julia Scott
* (TA) Aidan Prendergast

## [Project Name]
The Synth Surgeons Synthesizer is a fully operational sound generation chip that allows the user to play each of the 13 notes in a middle-range octave. As an added feature, the user can change the way in which each note sounds by toggling waveforms as well as playing pre-programmed sounds, such as a sound board. Additional features include an enable and reset button. 

## Base Source Files
Clock and nRst omitted from input lists.
- keypad_encoder.sv              : Synchronizer, Priority Encoder and Edge Detector Module code here.
  - Inputs: [14:0] keypad_i
  - Outputs: [3:0] keycode, mode_key, sound_edge
- frequency_divider.sv                : Frequency Generator Look-Up Table module.
  - Inputs: enable, [3:0] keycode, sound_series
  - Outputs: [15:0] divider
- oscillator.sv                  : Oscillator module.
  - Inputs: enable, [15:0] divider
  - Outputs: [15:0] count
- clock_div.sv   : Sample Rate Clock Divider module.
  - Inputs: enable
  - Outputs:sample_now
- sequential_divider.sv          : Sequential Divider module.
  - Inputs: enable, sample_now, [15:0] divider, [15:0] count
  - Outputs: [7:0] quotient
- waveshaper.sv                  : Waveshaper module.
  - Inputs: [7:0] quotient, wave_seleect
  - Outputs: [7:0] sample
- pwm.sv                         : PWM Conversion module.
  - Inputs: enable, [7:0] sample
  - Outputs: pwm_o
- mode_fsm.sv                    : Wave Mode Controller FSM module.
  - Inputs: mode_key
  - Outputs: [1:0] wave_select
- soundgen_fsm.sv                : Soundgen Controller FSM module.
  - Inputs: soundgen_edge
  - Outputs: [3:0] sound_series

## Testbenching
- tb_.sv : This is the test bench used to test your design.

## Pin Layout
Put all the GPIO pin numbers, i/o/io determination, and labels

Name:                I/O:                Description:                                  Pin #:
Clock                I                   Timing component                              N/A
Reset                I                   Resets output supply when active low          N/A
Keys                 I                   13 buttons assigned to each of the 13 notes   [12:0]
                                         in one middle-range octave
Mode                 I                   1 button that toggles 3 waveforms             [13]
Sound_series         I                   1 button that toggles 2 pre-programmed sounds [14]
Pwm_o                O                   System output that connects to speakers       [15]

Total I/O pins: 16

## Supporting Equipment
speaker, amplifier, low-pass filter

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

### Wednesday, July 5th: Final Design Presentations

## Some Legal Statement
From Purdue that I haven't figured out yet, maybe some stuff about Dr. J, the program, and other instructors
