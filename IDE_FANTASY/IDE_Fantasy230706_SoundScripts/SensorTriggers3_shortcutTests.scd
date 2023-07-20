/* 12 Jul 2023 16:20

*/


{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
\x1.ml(500, 600, \freq, \test);

{ SinOsc.ar(\freq.br(400), 0, 0.1).dup }.gt(\x1, 0.3) +> \test;
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup }.lt(\x1, 0.4) +> \test;