/*  9 Jun 2023 16:08

*/
//:wave like
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.2) * 30
} +> \natali;
//:wind like / whistle like
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.01) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		SinOsc.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;

//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = SinOsc.ar(400, 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = LFSaw.ar(400, 0, 0.01) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = LFSaw.ar(400, 0, 0.01) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = LFSaw.ar(\x3.sr.lag(0.1).exp(300, 400), 0, 0.01) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = LFSaw.ar(\x3.sr.lag(0.1).exp(50, 150), 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	// env = Env.perc(0.9, 2);
	src = LFSaw.ar(\x3.sr.lag(0.1).exp(200, 500), 0, 0.01) *
	(\x2.sr.lag(0.1) > 0.5);
	Resonz.ar(src,
		\z2.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	// env = Env.perc(0.9, 2);
	src = LFSaw.ar(\x3.sr.lag(0.1).exp(30, 150), 0, 0.1) *
	(\x2.sr.lag(0.1) > 0.5).lag(0.5);
	Resonz.ar(src,
		\z3.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//:
{
	var env, src;
	// env = Env.perc(0.9, 2);
	src = LFSaw.ar(\x3.sr.lag(0.1).exp(40, 150), 0, 0.1) *
	(\x2.sr.lag(0.1) > 0.5).lag(0.5);
	Resonz.ar(src,
		\z3.sr.exp(30, 6000).lag(0.1)
		*
		LFNoise1.ar(10).range(0.8, 1.2)
		, 0.2) * 30
} +> \natali;
//: