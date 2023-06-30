//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [0.7, 1.2] * Line.kr(3, 0.5, 4.2)
		* SinOsc.ar(7).range(0.9, 1.1)
	).dup * 0.1 * Env.perc(0.3, 5.0).kr(doneAction: 2) } +> \pongtest;
}
