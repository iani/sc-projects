/*  9 Jun 2023 15:21
Trigger with slope: Produce sound when a parameter's change is higher than
a threshold.
*/
//:
\default +> \test;
//:
Server.default.scope;
//:

//:
{
	var env, src;
	env = Env.perc(0.1, 0.1);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 1.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.1) * 30
} +> \jun;
//:
{
	var env, src;
	env = Env.perc(0.1, 0.1);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(
			\x1.sr.lag(0.01)
			+ \y1.sr.lag(0.01)
			+ \z1.sr.lag(0.01)

		)) > 1.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.1) * 30
} +> \jun;
//:
{
	var env, src;
	env = Env.perc(0.1, 0.1);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(
			\x1.sr.lag(0.01)
			+ \y1.sr.lag(0.01)
			+ \z1.sr.lag(0.01)

		)) > 1.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.1) * 30
} +> \jun;
//:

//:
{
	WhiteNoise.ar(0.01) * Decay2.kr(Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9)
} +> \natali;
//:
{
	var env = Env.perc;
	WhiteNoise.ar(0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	)
} +> \jun1;
//:
{
	var env, src;
	env = Env.perc(0.01, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Ringz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 1.6)
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Ringz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 1.6)
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.1) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.01, 2);
	src = WhiteNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Ringz.ar(src, (\z2.sr.lag(0.2).lin(20, 40) * 2).round(1).midicps, 0.6)
} +> \natali;
//:
{
	var env, src;
	env = Env.perc;
	src = WhiteNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Ringz.ar(src, \z2.sr.exp(30, 6000).lag(0.5), 0.6)
} +> \natali;
//:
{
	WhiteNoise.ar(0.1) * Changed.kr(\x1.sr)
} +> \natali;
//:
{
	WhiteNoise.ar(\x2.sr);
} +> \natali;