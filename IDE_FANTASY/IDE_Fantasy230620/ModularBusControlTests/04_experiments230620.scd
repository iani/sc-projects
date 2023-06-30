/* 20 Jun 2023 17:29

*/

{
	a = SinOsc.ar(
	\freq.br(400), 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * \amp.br(0.1);
} +> \d1;
//:
{ 	\x2.sr.lin(36, 48).midicps } @>.d1 \freq;
{ 	\x2.sr.lin(86, 98).midicps } @>.d1 \freq;
//:
{ 	(\z2.sr > 0.5).lag(0.5) * 0.1 } @>.d1 \amp;
//:
{ 	(\z2.sr.lag(0.1) > 0.5).lag(0.5) * 0.1 } @>.d1 \amp;
//:------------ movement triggers note on - modular check
{
	var env;
	env = Env.perc(0.9, 0.9);
	0.1 * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} @>.d1 \amp


//:movement triggers note on - early check
{
	var env, src;
	env = Env.perc(0.9, 0.9);
	src = SinOsc.ar(\z2.sr.exp(30, 6000).lag(0.1), 0, 0.3).dup * env.kr(gate:
		Amplitude.kr(Slope.kr(\x2.sr.lag(0.1))) > 0.9, doneAction: 0
	);
} +> \natali
