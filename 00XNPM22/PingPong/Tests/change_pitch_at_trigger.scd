{ SinOsc.ar(\freq.br(400), 0, \amp.br(0.1)).dup } +> \pingpong;
//:
{ (\x20.sr > 0.8).lag(1.5) * 1 } @>.pingpong \amp;
//:
{ (\x20.sr > 0.8) * 0.1 } @>.pingpong \amp;
//:
{ \z20.sr.lag(0.2).exp(400, 800) } @>.pingpong \freq
//:
{
	(\z20.sr.lag(0.2)
		*
		LFNoise1.kr(1).range(0.5, 5)
	)
	.exp(400, 800)

} @>.pingpong \freq
//:use drand to trigger new pitch at each trigger of new ball
{
var a, freq, trig;
    a = Drand([1, 3, 2, 7, 8], inf);
    trig = (\x20.sr > 0.8);
	// trig = Impulse.kr(MouseX.kr(1, 400, 1));
    freq = Demand.kr(trig, 0, a) * 30 + 340;
} @>.pingpong \freq;
//:use drand to trigger new pitch at each trigger of new ball
{
var a, freq, trig;
    a = Dseq([1, 3, 2, 7, 8, 10, 11, 12, 15, 32], inf);
    trig = (\x20.sr > 0.8);
	// trig = Impulse.kr(MouseX.kr(1, 400, 1));
    freq = Demand.kr(trig, 0, a) * 30 + 340;
} @>.pingpong \freq;
//:use drand to trigger new pitch at each trigger of new ball
{
var a, freq, trig;
    a = Dseq([0, 3, 5, 7, 8, 10, 11, 12], inf);
    trig = (\x20.sr > 0.8);
	// trig = Impulse.kr(MouseX.kr(1, 400, 1));
    freq = (Demand.kr(trig, 0, a) + 60).midicps;
} @>.pingpong \freq;