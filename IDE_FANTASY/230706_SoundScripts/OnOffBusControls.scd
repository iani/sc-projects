/*  6 Jul 2023 15:14
Triggering and switching on-off based on sensor input,

- by setting amp bus.
- by sending trigger commands
- by starting synth pleyers ...
*/
//:onoff first test.
{ SinOsc.ar(400, 0, 0.1).dup * (\x1.sr < 0.5).lag(1) } +> \test;
