//:
{
	Resonz.ar(
		PinkNoise.ar(0.5),
		\freq.br(10),
		20
	).dup * (\z5.sr - 0.3).max(0) * 3
	// * (\z5.sr > 0.5).lag(0.1);
} +> \jun;
//
{ XLine.kr(10, 1500, 180) } @>.jun \freq;
//
{
	Resonz.ar(
		PinkNoise.ar(1),
		\freq.br(1000),
		20
	).dup * (\z6.sr - 0.3).max(0) * 3
	// * (\z6.sr > 0.5).lag(1);
} +> \asayo;
{ XLine.kr(1500, 10, 180) } @>.asayo \freq;
//: