/* 28 Dec 2022 20:15
Tried asayo on x5 and jun on x5.
With headbands.
Gradual changes as written here, done with code.
Next example (Duet2) will try automating the gradual changes using Line.
*/
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
