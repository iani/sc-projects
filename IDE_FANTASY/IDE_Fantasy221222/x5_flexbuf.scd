//: WIND! 22 Dec 2022 19:12
{// | buf = 0 |
	PlayBuf.ar(
		1,
		\buf.kr(\kiiroi.buf),
		//\buf.kr(\pilgrims.buf),
		\x5.sr.lin(0.63, 0.90),
		// \x8.sr.lin(0.3, 1.0),
		// \x8.sr.lin(0.5, 1.5),
		// \x8.sr.lin(1.0, 3.0),
		// \x8.sr.lin(0.8, 1.2),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup * (\z5.sr > 0.4).lag(1) * \x5.sr.lin(0.01, 1.9)
} +> \x5;