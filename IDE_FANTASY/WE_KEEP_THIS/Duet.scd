/* 29 Dec 2022 11:43

*/

//: THIS ONE:
//: ASAYO
{
	var dur;
	dur = 5 * 60;
	Ringz.ar(
		PinkNoise.ar(0.1),
		\z5.sr.round(XLine.kr(0.0001, 0.2, dur)).exp(50, 2500).lag(0.05),
		XLine.kr(0.01, 0.5, dur) // three minutes
	)
	* \amp.br(1)
} +> \x5;

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

//:
\x5 stop: 20;

\x6 stop: 20;
//
