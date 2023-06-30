/* 28 Dec 2022 20:15
Here we try to combine the filtered noise sound with the
cricket playbuf sound for Asayo.

*/
//: THIS ONE:
//: ASAYO
{
	var dur;
	dur = 5 * 60;
	Ringz.ar(
		PinkNoise.ar(0.01),
		// \z5.sr.round(XLine.kr(0.0001, 0.2, dur)).exp(50, 2500).lag(0.05),
		\z5.sr.round(0.05).exp(50, 2500), // .lag(0.05),
		0.15
		// XLine.kr(0.01, 0.5, dur) // three minutes
	).dup * \noiseamp.br(1)
	+
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		\x5.sr.lin(0.005, 0.250).lag(0.5),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup;
	//	;// * (\z6.sr - 0.3).lin(0.0, 15.0)
} +> \x5;
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


//:
0 @>.x5 \noiseamp;
0.2 @>.x5 \noiseamp;


0 @>.x5 \amp;
1 @>.x5 \amp;
//:
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
//:
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.1).exp(150, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.05).exp(150, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5;
// THIS ONE:
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.05).exp(50, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.1).exp(50, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.1).exp(50, 1500) /*.lag(0.05) */, 1.3) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.01).exp(50, 1500) /*.lag(0.05) */, 1.3) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.round(0.01).exp(50, 1500) /*.lag(0.05) */, 0.3) * \amp.br(1) } +> \x5
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(5), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Dust.kr(5), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(7), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(3), 0.3)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(16), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Dust.kr(16), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Dust.kr(10), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(12), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Impulse.kr(2), 0.1)
	* \amp.br(1)
} +> \x6;
//:ONe additional sound:
{
	Mix(Ringz.ar(
		PinkNoise.ar(0.1),
		(\y6.sr.exp(50, 2500) * [1, 1.1, 1.2, 1.3, 1.4, 1.5]).lag(0.05),
		0.5)
	) * Decay.kr(Dust.kr(5), 0.1)
	* \amp.br(1)
} +> \x6;
