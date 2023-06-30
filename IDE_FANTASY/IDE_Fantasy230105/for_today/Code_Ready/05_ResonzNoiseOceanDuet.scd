//:
{
	Resonz.ar(
		PinkNoise.ar(0.5),
		\freq.br(10),
		20
	).dup * (\z5.sr - 0.3).lin(0, 2).max(0).lag(1) * 4
	// * (\z5.sr > 0.5).lag(0.1);
} +> \jun;
//:
//
//
{
	Resonz.ar(
		PinkNoise.ar(0.5),
		\freq.br(1000),
		20
	).dup * (\z6.sr - 0.3).lin(0, 2).max(0).lag(1) * 4
	// * (\z6.sr > 0.5).lag(1);
} +> \asayo;

//
//:
{ XLine.kr(10, 1500, 240) } @>.jun \freq;
{ XLine.kr(1500, 10, 240) } @>.asayo \freq;
//:
