//:silencing deactivated
{
	PlayBuf.ar(
		1,
		\buf.kr(\silence.buf),
		\x8.sr.lin(0.13, 2.0), // \rate.kr(1),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader // * (\z8.sr > 0.5).lag(1)
} +> \test;