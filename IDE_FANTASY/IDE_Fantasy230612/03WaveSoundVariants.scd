/* 11 Jun 2023 14:40
To try out
*/
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z2.sr.exp(30, 6000).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \natali
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z2.sr.exp(3000, 6000).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \natali
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z2.sr.exp(30, 6000).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src * \x2.sr.lag(0.1).linexp(0.2, 0.7, 0.001, 1.0)
} +> \natali
//:
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z2.sr.exp(30, 6000).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	src * \x2.sr.lag(0.1).linexp(0.2, 0.7, 0.001, 1.0)
	* LFDNoise1.kr(z2.sr.lag(0.1).range(0.5, 10)).range(0.8, 1.2)
} +> \natali
//: