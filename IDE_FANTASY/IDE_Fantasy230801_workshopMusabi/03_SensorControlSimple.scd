{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ \x1.sr.exp(100, 10000) } @>.test \freq;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup * \vol.br(0) } +> \test;
//:
{ \x1.sr(0.0) } @>.test \vol;
//:
{ Slope.kr(\x1.sr(0.0)) } @>.test \vol;
//:
{ Amplitude.kr(Slope.kr(\x1.sr(0.0)), 0.1, 1) } @>.test \vol;
//:
{
	var sensors;
	sensors = [\x1, \y1, \z1] collect: { | s |
		Amplitude.kr(Slope.kr(s.sr(0.0)), 0.2, 0.5).lag(0.1)
	};
	Mix(sensors) * 0.1;
} @>.test \vol;
//:

Amplitude.kr(Slope.kr(\x1.sr(0.0)), 0.1, 1) } @>.test \vol;
//:
{ \x1.sr.exp(100, 10000) } @>.test \freq;
{ Xyz() } @>.test \vol;
