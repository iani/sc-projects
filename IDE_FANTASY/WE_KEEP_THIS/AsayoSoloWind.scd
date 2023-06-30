/* 28 Dec 2022 20:15
Here we try to combine the filtered noise sound with the
cricket playbuf sound for Asayo.

*/
/* 29 Dec 2022 11:46
Transferred to We Keep This.
*/
//:
{
	var dur;
	dur = 5 * 60;
	Ringz.ar(
		PinkNoise.ar(0.01),
		// \z5.sr.round(XLine.kr(0.0001, 0.2, dur)).exp(50, 2500).lag(0.05),
		\z5.sr.round(0.05).exp(50, 2500)
		*
		XLine.kr(0.1, 5, 300)
		, // .lag(0.05),
		0.15
		// XLine.kr(0.01, 0.5, dur) // three minutes
	).dup * \noiseamp.br(1)
	+
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		\x5.sr.lin(0.005, 0.250).lag(0.5)
		*
		XLine.kr(0.1, 5, 300),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup;
	//	;// * (\z6.sr - 0.3).lin(0.0, 15.0)
} +> \x5;
