/*  5 Jan 2023 13:48

*/

//: Jun controls volume with sensor above right knee
// asayo controls
{
	Ringz.ar(
		PinkNoise.ar(
			(\z2.sr - 0.3).lin(0.0, 0.1).lag(1)  // version A Asayo!!!! -- Volume !!!
		)  // version B Jun Volume
		// * 0.1,  /// THIS KEEP
		// KEEP THIS
		// * Decay.kr(Impulse.kr(\x6.sr.exp(6/3, 25).round(1).max(0.1)), 0.02),
		* Decay.kr(Impulse.kr((\x2.sr + 0.2).exp(6/3, 25).round(1).max(0.1)), 0.02),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 15).round(0.2).max(0.1)), 0.02),
	    // * Decay.kr(Impulse.kr(\x6.sr.exp(0.9, 15).round(0.1).max(0.15)), 1),
		// * Decay.kr(Impulse.kr(\x6.sr.exp(0.1, 10).round(1).max(0.15)), 0.1),
		// LFNoise1.kr(5).range(0.2, 1.5) *
		// version A: Jun: frequency + ringtime
		// version B ASAYO: frequency + ringtime
		// (\y5.sr.lin(30, 40).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		// (\y5.sr.lin(30, 50).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		(\y1.sr.lin(35, 55).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		// (\y5.sr.lin(40, 70).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		// (\y5.sr.lin(20, 60).round(1) * 2 * [1, 1.2]).midicps, //  .lag(1),
		\x1.sr.lin(0.001, 0.5) // .round(0.1)
	) * 3.95
} +> \otonobunraku;

//: ======= REDO CONTROLS FROM ABOVE

{
	Ringz.ar(
		// source. amp controlled on-off by jun
		PinkNoise.ar((\z1.sr - 0.3).lin(0.0, 0.1).lag(1))
		* Decay.kr(
			// pulse envelope controlled by Asayo
			Impulse.kr(
				(\x2.sr + 0.2).exp(6/3, 25).round(1).max(0.1)
			), 0.02
		),
		// frequency controlled by asayo
		(\y2.sr.lin(35, 55).round(1) * 2 * [1, 1.2]).midicps,
		// decaytime controlled by asayo
		\x2.sr.lin(0.001, 0.5)
	) * 3.95
} +> \otonobunraku;