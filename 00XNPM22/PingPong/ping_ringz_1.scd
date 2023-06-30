Pings addSound: {
//:
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
//:
};