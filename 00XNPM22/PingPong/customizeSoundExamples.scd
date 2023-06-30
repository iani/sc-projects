/*  2 Dec 2022 18:35
Here is how to add a custom action when receiving a ping or a pong ball:
*/
\myping.addNotifier(\pingpong, \pongIsOn, {
	(degree: (10..5).prand(10) * 2, dur: [0.15, 0.1].prand(10)) +> \ping;
});
//:
\mypong.addNotifier(\pingpong, \pingIsOn, {
	(degree: (10..5).prand(10) + 3, dur: [0.05, 0.1].prand(10)) +> \ping;
	// (degree: (-10..-5).pseq(1), dur: 0.05) +> \ping;
});
//:
\myping.addNotifier(\pingpong, \pongIsOn, {
	[\g, \clap, \cymbal].choose.buf.play;
});
//:
\mypong.addNotifier(\pingpong, \pingIsOn, {
	[\sheep, \jeep, \tank].choose.buf.play;
});
//:
\sheep.pIng;
\cymbal.pOng;
//:

\mypong.addNotifier(\pingpong, \pingIsOn, {
(bufnum: [\sheep, \jeep, \tank].pseq(1).bufnums,
dur: 0.25, instrument: \playbuf2) +> \pongtest;
});

//:

\myping.addNotifier(\pingpong, \pongIsOn, {
(bufnum: [\g, \clap, \cymbal].pseq(1).bufnums,
dur: 0.25, instrument: \playbuf1) +> \pongtest;
});
//:
\myping.addNotifier(\pingpong, \pongIsOn, {
{ SinOsc.ar(400 * [1, 1.2]) * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
{ SinOsc.ar(400 rrand: 500 * [1, 1.2]) * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
});
//:
Pings addSound: {
	{ SinOsc.ar(400 rrand: 500 * [1, 1.2]).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

//:
Pongs addSound: {
	{ LFSaw.ar(400 rrand: 500 * [1, 1.25]).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

//:
Pings addSound: {
	{ WhiteNoise.ar().dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
};

Pongs addSound: {
	{ PinkNoise.ar().dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}
//:
Pings addSound: {
	{ SinOsc.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(1, 2, 0.1)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}
//:
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3; n
	{ SinOsc.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
//:
Pongs addSound: {
	{ LFSaw.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
//:
/*
Pings addSound: ....


Pongs addSound: ....

*/
