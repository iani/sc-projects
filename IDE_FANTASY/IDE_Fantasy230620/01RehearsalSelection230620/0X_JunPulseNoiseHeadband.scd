/*  5 Jan 2023 12:38

*/
//: JUN
{
	var dur;
	dur = 5 * 60;
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(XLine.kr(1, 16, dur)), XLine.kr(0.05, 0.5, dur))
	* \amp.br(1)
} +> \x6
//:Asayo's Part? crickets???????

//: WIND! 22 Dec 2022 19:12
//????????? This one?
// Jun controls on-off
{// | buf = 0 |
	PlayBuf.ar(
		1,
		// \buf.kr(\kiiroi.buf),
		\buf.kr(\pilgrims.buf),
		\x5.sr.lin(0.03, 0.90).lag(0.5),
		// \x8.sr.lin(0.3, 1.0),
		// \x8.sr.lin(0.5, 1.5),
		// \x8.sr.lin(1.0, 3.0),
		// \x8.sr.lin(0.8, 1.2),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup /* (\z6.sr < 0.7).lag(0.1) */ *  1.0 * (\z6.sr - 0.3).lin(0.0, 15.0)
} +> \x5;