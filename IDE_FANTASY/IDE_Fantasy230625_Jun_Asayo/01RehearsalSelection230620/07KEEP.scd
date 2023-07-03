/* 25 Jun 2023 14:59

*/

//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5))) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:
//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5).reciprocal) + 100 ) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5).reciprocal) + 100 ) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5).reciprocal) + 100 ) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5).reciprocal) + 100 ) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 1.9, doneAction: 0
	);
} +> \jun1;
//:KEEP
{
	var env, src;
	env = Env.perc(0.15, 0.05);
	src =  SinOsc.ar(
		(\freq.br(200) * Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.51)
			 + \y2.sr.lag(0.51)
			 + \z2.sr.lag(0.51)
		)).lag(1.5).reciprocal) + 100 ) *
	 env.kr(gate:
		 Amplitude.kr(Slope.kr(
			 \x2.sr.lag(0.01)
 			 + \y2.sr.lag(0.01)
			 + \z2.sr.lag(0.01)
		 )) > 2.9, doneAction: 0
	);
} +> \jun1;
//: