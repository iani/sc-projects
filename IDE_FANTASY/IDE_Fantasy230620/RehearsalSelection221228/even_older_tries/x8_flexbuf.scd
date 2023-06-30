//:
{
	PlayBuf.ar(
		1,
		\buf.kr(\silence.buf),
		\x8.sr.lin(0.13, 2.0),
		// \x8.sr.lin(0.3, 1.0),
		// \x8.sr.lin(0.5, 1.5),
		// \x8.sr.lin(1.0, 3.0),
		// \x8.sr.lin(0.8, 1.2),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup * (\z8.sr > 0.5).lag(1)
} +> \x8;