//: WIND! 22 Dec 2022 19:12
{// | buf = 0 |
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		\x5.sr.lin(0.005, 0.250).lag(0.5),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup * (\z6.sr - 0.3).lin(0.0, 15.0) /* (\z6.sr < 0.7).lag(0.1) */
} +> \x5;
//:
(buf: \pilgrims.buf) ++> \x5;

(buf: \crickets.buf) ++> \x5;
//:
{ Ringz.ar(PinkNoise.ar(0.1), \x5.sr.exp(50, 2500).lag(0.05), 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \x5.sr.round(0.1).exp(150, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \x5.sr.round(0.05).exp(150, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1), \x5.sr.round(0.05).exp(50, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
{ Ringz.ar(PinkNoise.ar(0.1 *), \x5.sr.round(0.05).exp(50, 1500) /*.lag(0.05) */, 0.1) * \amp.br(1) } +> \x5
//:
{ Ringz.ar(PinkNoise.ar(0.1), \y5.sr.exp(50, 2500).lag(0.05), 0.1) * \amp.br(1) } +> \x5

// THIS ONE:
{ Ringz.ar(PinkNoise.ar(0.1), \z5.sr.exp(50, 2500).lag(0.05), 0.1) * \amp.br(1) } +> \x5
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
//:


(buf: \weddell.buf) ++> \x5;

(buf: \kiiroi.buf) ++> \x5;
(buf: \bird_crickets.buf) ++> \x5;
(buf: \birdcarman.buf) ++> \x5;
(buf: \birdcarmanshort.buf) ++> \x5;
(buf: \cricket_ff.buf) ++> \x5;
(buf: \cricket_taps.buf) ++> \x5;
(buf: \crossing.buf) ++> \x5;
(buf: \echo_crickets.buf) ++> \x5;
(buf: \fones.buf) ++> \x5;
(buf: \hanbaiki.buf) ++> \x5;
(buf: \lake_plane.buf) ++> \x5;
(buf: \loud_crickets.buf) ++> \x5;
(buf: \melodia1.buf) ++> \x5;
(buf: \melodia2.buf) ++> \x5;
(buf: \melodic_road.buf) ++> \x5;
(buf: \noisebirdsclick.buf) ++> \x5;
(buf: \rough_steps.buf) ++> \x5;
(buf: \swallows.buf) ++> \x5;
(buf: \weddell.buf) ++> \x5;
(buf: \weddellpock.buf) ++> \x5;
(buf: \wind_moderate.buf) ++> \x5;
(buf: \wind_strong.buf) ++> \x5;
