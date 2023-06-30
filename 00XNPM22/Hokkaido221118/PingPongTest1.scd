

{ WhiteNoise.ar(\amp.br(0.1)).dup } +> \pingpong;

{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \pingpong;



// { \x21.sr > 0.5 * 1 } @>.pingpong \amp
{ (Slope.kr(\x21.sr.lag(0.2)).lag(0.2) > 1).lag(0.5) * 1 } @>.pingpong \amp
// { \x21.sr > 0 } @>.pingpong \amp
// { \x21.sr.lin(400, 4000) } @>.pingpong \freq