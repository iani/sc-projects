/* 25 Jun 2023 13:38

*/
//:
//:
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(\freq.br(200)) *
	 env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.01))) > 2.0, doneAction: 0
	);
} +> \jun1;

//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(0.5)) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(0.2).round(0.5)) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;

//:
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(0.2).round(0.5)) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;

//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = SinOsc.ar(\freq.br(200)).lag(1).dup;
	src * env.kr(gate:
		Amplitude.kr(Slope.kr(\x1.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \jun;
//:
{
	var env, src;
	env = Env.perc(0.9, 2);
	src = [
		SinOsc.ar(\freq.br(400)).dup.fader * (\z3.sr > 0.5).lag(1),
		SinOsc.ar(\freq.br(500)).dup.fader * (\z4.sr > 0.5).lag(1)
	];
	src * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \asayo;