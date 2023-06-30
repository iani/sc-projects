

{ WhiteNoise.ar(\amp.br(0.1)).dup } +> \pingpong;

{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \pingpong;



// { \x21.sr > 0.5 * 1 } @>.pingpong \amp
{ (Slope.kr(\x20.sr.lag(0.2)).lag(2.9) > 0.1).lag(0.5) * 1 } @>.pingpong \amp
// { \x21.sr > 0 } @>.pingpong \amp
// { \x21.sr.lin(400, 4000) } @>.pingpong \freq
//:


{ WhiteNoise.ar(\amp.br(0.1)).dup } +> \pingpong;
//:
{ SinOsc.ar(\freq.br(400), 0, \amp.br(0.1)).dup } +> \pingpong;
//:


//: { \x21.sr > 0.5 * 1 } @>.pingpong \amp
// { (Slope.kr(\x20.sr.lag(0.2)).lag(2.9) > 0.1).lag(0.5) * 1 } @>.pingpong \amp
//: { \x21.sr > 0.5 * 1 } @>.pingpong \amp
{ (\x20.sr > 0.8).lag(1.5) * 1 } @>.pingpong \amp
//: { \x21.sr > 0 } @>.pingpong \amp
// { \x21.sr.lin(400, 4000) } @>.pingpong \freq
//:
{ \z20.sr.lag(0.2).exp(400, 800) } @>.pingpong \freq
//:
{
	(\z20.sr.lag(0.2)
		*
		LFNoise0.kr(1).range(0.5, 5)
	)
	.exp(400, 800)

} @>.pingpong \freq
//: