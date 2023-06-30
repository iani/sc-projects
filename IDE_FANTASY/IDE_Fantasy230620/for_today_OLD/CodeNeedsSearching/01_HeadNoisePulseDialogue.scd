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

