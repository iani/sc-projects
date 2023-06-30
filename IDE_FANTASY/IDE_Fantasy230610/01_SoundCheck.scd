/*  6 Jun 2023 15:27

*/
\default +> \test;


{ WhiteNoise.ar([0.05, 0]); } +> \ampcheck1;
{ WhiteNoise.ar([0, 0.05]); } +> \ampcheck1;

//:Stereo output check
{ SinOsc.ar(400, 0, [0.1, 0]); } +> \ampcheck1;
//:Sensor control check
{ SinOsc.ar(400, 0, 0.1).dup * (\x1.sr > 0.3) } +> \ampcheck1;
{ SinOsc.ar(400, 0, 0.1).dup * (\x1.sr < 0.5) } +> \ampcheck1;
{ WhiteNoise.ar(0.05).dup * (\x1.sr < 0.5) } +> \ampcheck1;
