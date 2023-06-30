//: WIND! 22 Dec 2022 19:12
{// | buf = 0 |
	PlayBuf.ar(
		1,
		\buf.kr(\pilgrims.buf),
		\y5.sr.lin(0.05, 0.090).lag(0.5),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup /* (\z6.sr < 0.7).lag(0.1) */ *  1.0 * (\z6.sr - 0.3).lin(0.0, 15.0)
} +> \x5;
//:
(buf: \crickets.bufnum) @> \x5;
//:
\vtivkr
//:
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 15.0)),
		\y5.sr.exp(150, 2000).lag(0.5),
		0.01
	)
} +> \x5;
//:
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 15.0)),
		(\y5.sr.lin(10, 40).round(1) * 3).midicps,
		0.05
	)
} +> \x5;
//:
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 15.0)),
		(\y5.sr.lin(40, 70).round(1) * 2).midicps,
		0.05
	)
} +> \x5;
//:
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 15.0).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(1, 7))),
		(\y5.sr.lin(40, 70).round(1) * 2).midicps,
		0.05
	)
} +> \x5;
//:i This wwe recorded on hard disk + data + video!  4 Jan 2023 16:17
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15))),
		(\y5.sr.lin(20, 50).round(1) * 2).midicps,
		0.05
	)
} +> \x5;

//: This is a variation
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15)), 0.02),
		(\y5.sr.lin(20, 50).round(1) * 2).midicps,
		\z5.sr.lin(0.01, 0.25)
	)
} +> \x5;

//: This is a variation
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15)), 0.02),
		(\y5.sr.lin(20, 50).round(1) * 2).midicps,
		\z5.sr.lin(0.01, 0.25)
	) * 3
} +> \x5;

//: Here we try a slow gradual startup
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* 0.1,
		// * Decay.kr(Impulse.kr(\x6.sr.exp(1/3, 25).round(1).max(0.1)), 0.02),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.2).max(0.1)), 0.02),
	    // * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 5).round(0.1).max(0.15)), 1),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 10).round(1).max(0.15)), 0.1),
		// LFNoise1.kr(5).range(0.2, 1.5) *
		(\y5.sr.lin(40, 70).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		\x5.sr.lin(0.001, 0.5) // .round(0.1)
	) * 2.95
} +> \x5;

//: Here we try a slow gradual startup
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		// * 0.1,
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.2).max(0.1)), 0.02),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.01).max(0.05)), 1),
		(\y5.sr.lin(20, 50).round(1) * 2 * [1, 1.2]).midicps,
		\z5.sr.lin(0.01, 0.25)
	) * 1
} +> \x5;

//: Here we try a slow gradual startup
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		// * 0.1,
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.2).max(0.1)), 0.02),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.01).max(0.05)), 1),
		(\y5.sr.lin(20, 50).round(1) * 2 * [1, 1.2]).midicps,
		\z5.sr.lin(0.01, 0.25)
	) * 3
} +> \x5;

//: This is a variation
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15)), 1.5),
		(\y5.sr.lin(20, 50).round(1) * 2).midicps,
		\z5.sr.lin(0.01, 0.25)
	) * 0.3
} +> \x5;

//: This is a variation
{
	Ringz.ar(PinkNoise.ar(
		(\z6.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15)), LFNoise0.kr(1/5).range(0.01, 1)),
		(\y5.sr.lin(20, 50).round(1) * 2).midicps,
		\z5.sr.lin(0.01, 0.25)
	) * 3
} +> \x5;
