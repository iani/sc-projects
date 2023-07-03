//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = 0.2 * SinOsc.ar(\z2.sr.exp(30, 600).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \jun1
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = 0.2 * SinOsc.ar(\z2.sr.exp(100, 200).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \jun2
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = LFDNoise1.ar(\z2.sr.exp(30, 6000).lag(0.1), 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \jun1
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = LFDNoise1.ar(\z2.sr.exp(3000, 600).lag(0.1), 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \jun1
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = LFDNoise1.ar(\z2.sr.exp(3000, 600).lag(0.1), 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src * \amp.br(1);
} +> \jun1
//:
{  SinOsc.ar(400, 0, 0.1) * (\x3.sr > 0.5).lag(1) } +> \asayo;
//:
{ Decay.kr(Impulse.kr(1)) } @>.jun1 \amp;
//:
{ Decay.kr(Impulse.kr(10)) } @>.jun1 \amp;
//:
{ Decay.kr(Impulse.kr(Line.kr(1, 10, 20))) } @>.jun1 \amp;
//:
{ Decay.kr(Impulse.kr(Line.kr(20, 1, 20))) } @>.jun1 \amp;
//:
//:
//: