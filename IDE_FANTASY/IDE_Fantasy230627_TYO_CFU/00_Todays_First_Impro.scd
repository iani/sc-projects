/* 27 Jun 2023 23:19

*/

//:
{
	var env, src;
	env = Env.perc(0.9, 0.09);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x6.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z6.sr.exp(300, 6000).lag(0.1), 0.1) * 20
} +> \yoshida;
//:
//:
{
	var env, src;
	env = Env.perc(0.9, 0.09);
	src = PinkNoise.ar(2.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x5.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z5.sr.exp(100, 1200).lag(0.1), 0.05) * 20
} +> \mary;
//:
