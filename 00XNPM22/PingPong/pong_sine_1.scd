//:
Pongs addSound: {
	{ SinOsc.ar(
		600 rrand: 1500 * [1, 1.1] * Line.kr(1, 1.2, 1.5)
	).dup * 0.1 * Env.perc(0.5, 2).kr(doneAction: 2) } +> \pongtest;
}
