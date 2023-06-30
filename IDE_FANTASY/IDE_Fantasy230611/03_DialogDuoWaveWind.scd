/* 11 Jun 2023 15:50

*/

//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z2.sr.exp(30, 6000).lag(0.1), 0.1) * 20
} +> \natali;
//:
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = PinkNoise.ar(0.3) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Resonz.ar(src, \z4.sr.exp(30, 6000).lag(0.1), 0.1) * 20
} +> \justine;
//:Variant with sine
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z4.sr.exp(30, 6000).lag(0.1)).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z4.sr.exp(300, 600).lag(0.1)).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.09);
	src = SinOsc.ar(\z4.sr.exp(100, 200).lag(0.1), 0, 0.1).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.09);
	src = SinOsc.ar(\z4.sr.exp(1000, 1200).lag(0.1), 0, 0.1).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.009, 0.01);
	src = SinOsc.ar(\z4.sr.exp(500, 1200).lag(0.1).round(100), 0, 0.1).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.91);
	src = SinOsc.ar(\z4.sr.exp(400, 1500).lag(0.1).round(50) * [1, 1.999], 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.09);
	src = SinOsc.ar(\z4.sr.exp(300, 600).lag(0.1)).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.009, 0.09);
	src = SinOsc.ar(\z4.sr.exp(300, 600).lag(0.1)).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \justine;
//:
//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.91);
	src = SinOsc.ar(\z4.sr.exp(400, 1500).lag(0.1).round(50) * [1, 1.999], 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \natali;

//:Variant with sine
{
	var env, src;
	env = Env.perc(0.09, 0.91);
	src = SinOsc.ar(\z4.sr.exp(1400, 2500).lag(0.1).round(50) * [1, 1.01], 0, 0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x3.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src;
} +> \natali;
