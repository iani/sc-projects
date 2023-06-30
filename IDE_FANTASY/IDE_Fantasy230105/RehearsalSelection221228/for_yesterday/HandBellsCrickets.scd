//:
{
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		// \x5.sr.lin(0.005, 0.250).lag(0.5)
		// *
		XLine.kr(0.01, 5, 180),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup
	* (\z5.sr < 0.5).lag(0.5) * 3 * XLine.kr(1, 0.2, 180)
} +> \jun;
//:
{
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		// \x5.sr.lin(0.005, 0.250).lag(0.5)
		// *
		XLine.kr(5, 0.01, 180),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup
	* (\z6.sr - 0.3).max(0) * 3 * XLine.kr(0.2, 5, 180)
} +> \asayo
//:
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