//:
Pongs addSound: {
	{ LFSaw.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}
