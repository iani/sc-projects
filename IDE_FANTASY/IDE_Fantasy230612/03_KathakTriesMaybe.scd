/* 11 Jun 2023 15:59

*/

//:
{
	var env, src;
	env = Env.perc(0.009, 0.009);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z4.sr.exp(30, 6000).lag(0.1), 0.1) * 20
} +> \justine;
//:
//:
{
	var env, src;
	env = Env.perc(0.009, 0.09);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z3.sr.exp(200, 400).lag(0.1), 0.1) * 20
} +> \justine1;
//:
{
	var env, src;
	env = Env.perc(0.009, 0.009);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x4.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z4.sr.exp(100, 200).lag(0.1), 0.1) * 20
} +> \justine2;
//:
//:
{
	var env, src;
	env = Env.perc(0.009, 0.09);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	// Resonz.ar(src, \z3.sr.exp(200, 400).lag(0.1), 0.1) * 20
} +> \justine1;
//:
{
	var env, src;
	env = Env.perc(0.009, 0.09);
	src = LFSaw.ar(1, 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z3.sr.exp(200, 400).lag(0.1), 0.01) * 250
} +> \justine1;
//:
{
	var env, src;
	env = Env.perc(0.009, 0.09);
	src = LFSaw.ar(1, 0, 1.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x4.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z4.sr.exp(1400, 1500).lag(0.1), 0.1) * 20
} +> \justine2;
