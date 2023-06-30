Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ LFSaw.ar(
		200 rrand: 300 * [1, 1.5] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
};