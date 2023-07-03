/*  3 Dec 2022 12:51
Making new playbuf synthdef from default synthdef.
*/
//:This does not work
SynthDef('playbuf1', { | out = 0, bufnum = 0, rate = 1, trigger = 0, startPos = 0, loop = 0, fadeTime = 0.02, amp = 1, gate = 1 |
	var src, env;
	src = PlayBuf.ar(1, bufnum, rate, trigger, startPos, loop, 2);
	//	env = EnvGen.kr(Env.new([1, 1, 0], #[1, 1], \lin, 1), \gate.kr, 1.0, 0.0, fadeTime, 2);
	Out.ar(out, src, * Linen.kr(gate, 0.01, 0.7, 0.3, 2)  * amp);
}).load;
//:this is a copy of the working default synthdef from Event in ScClassLibrary.
SynthDef(\default2, { arg out=0, freq=440, amp=0.1, pan=0, gate=1;
	var z;
	z = LPF.ar(
		Mix.new(VarSaw.ar(freq + [0, Rand(-0.4,0.0), Rand(0.0,0.4)], 0, 0.3, 0.3)),
		XLine.kr(Rand(4000,5000), Rand(2500,3200), 1)
	) * Linen.kr(gate, 0.01, 0.7, 0.3, 2);
	OffsetOut.ar(out, Pan2.ar(z, pan, amp));
}, [\ir]).add
//:
a = Synth(\default2);
a release: 5;
//:
SynthDef(\default3, { arg out=0, freq=440, amp=0.1, pan=0, gate=1;
	var z;
	z = LPF.ar(
		Mix.new(VarSaw.ar(freq + [0, Rand(-0.4,0.0), Rand(0.0,0.4)], 0, 0.3, 0.3)),
		XLine.kr(Rand(4000,5000), Rand(2500,3200), 1)
	) * Linen.kr(gate, 0.01, 0.7, 0.3, 2);
	OffsetOut.ar(out, Pan2.ar(z, pan, amp));
}).add
//:
a = Synth(\default3);
a release: 5;
//:
//:
SynthDef(\playbuf0, { arg out=0, freq=440, amp=0.1, pan=0, gate=1;
	var src, env;
	src = LPF.ar(
		Mix.new(VarSaw.ar(freq + [0, Rand(-0.4,0.0), Rand(0.0,0.4)], 0, 0.3, 0.3)),
		XLine.kr(Rand(4000,5000), Rand(2500,3200), 1)
	);
	env = Linen.kr(gate, 0.01, 0.7, 0.3, 2);
	OffsetOut.ar(out, src * env * amp);
}).add
//:first working prototype
SynthDef(\playbuf0a, { | out = 0, bufnum = 0, rate = 1, trigger = 0, startPos = 0, loop = 0, amp = 1, gate = 1 |
	var src, env;
	src = PlayBuf.ar(1, bufnum, rate, trigger, startPos, loop, 2);
	env = Linen.kr(gate, 0.01, 0.7, 0.3, 2);
	OffsetOut.ar(out, src * env * amp);
}).add;
//:
a = Synth(\playbuf0a, [bufnum: \crickets.bufnum, loop: 1]);
a release: 5;
//:variant with fadein and fadeout
SynthDef(\playbuf0b, { | out = 0, bufnum = 0, rate = 1, trigger = 0, startPos = 0, loop = 0,
	amp = 1, gate = 1 |
	var src, fin, fout, fader;
	src = PlayBuf.ar(1, bufnum, rate, trigger, startPos, loop, 2);
	fin = Linen.kr(1, \fin.kr(0.01));
	fout = Linen.kr(gate, 0.01, 0.7, 0.3, 2);
	fader = fin * fout;
	OffsetOut.ar(out, src * fader * amp);
}).add

//:
a = Synth(\playbuf0b, [bufnum: \crickets.bufnum, loop: 1]);
a = Synth(\playbuf0b, [bufnum: \crickets.bufnum, loop: 1, fin: 10]);
a.release;
a release: 0.04;
a release: 2;
//:variant with fadein and fadeout,
SynthDef(\playbuf0c, { | out = 0, bufnum = 0, rate = 1, trigger = 0, startPos = 0, loop = 0 |
	var src;
	src = PlayBuf.ar(1, bufnum, rate, trigger, startPos, loop, 2);
	OffsetOut.ar(out, src* Fader());
}).add
//:
a = Synth(\playbuf0c, [bufnum: \crickets.bufnum, fin: 10]);
//:
a release: 10;
//:
//:
a.free;
//: bs
a.set(\gate, -1);
//:
a.set(\trigger, 1);
a.set(\gate, 1);
//:
\crickets.numChannels;
//:
{ WhiteNoise.ar(0.1).dup * Env.fdsr.gate } +> \test;
\test.stop;
//:
(instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 0.5, rate: [0.5, 1.5].pwhite, fin: 3) +> \test;
//:
(instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 5, rate: [0.5, 1.5].pwhite) +> \test;
//:
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 4.5,
fin: 3,
fout: 5,
rate: [0.5, 1.5].pwhite,
legato: 1
) +> \test;
//:
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 1.5,
fin: 0.3,
fout: 5,
rate: [0.5, 1.5].pwhite,
legato: 1
) +> \test;
//:
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 1.5,
fin: ((1..15)/10).pseq,
fout: ((1..30) / 10).pseq,
rate: [0.15, 1.5].pwhite,
legato: 0.5
) +> \test;
//:
(instrument: \playbuf1, bufnum: \g.bufnum) +> \test;
//:
(instrument: Ppb(), bufnum: [\g, \crickets].pseq.bufnums, dur: 0.5) +> \test;
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum, fin: 10, fout: 10]);
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum]);
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum, fin: 10, fout: 0.01]);
//:
a.release;
//:
(buf: [\g, \crickets].pseq.bufnum, play: { ~buf.postln }) +> \test;
//:
(
bufnum: [\g, \crickets].pseq.bufnum,
// instrument: Ppb(),
play: {
	postln("bufnum is:" + ~bufnum + "test is:" + ~test);
	// postln("playing: buf:" + ~buf + "bufnum" + ~bufnum + "numChannels" + ~numChannels);
	// ~buf.postln;
	// ~bufnum.postln;
	// ~numChannels.postln;
}
) +> \test;
//:
\x.numChannels;

a = \g.bufnums.asStream;
a.next;
(bufnum: \g.bufnums, instrument: \playbuf2) +> \test;
//:
(bufnum: \crickets.bufnums, instrument: \playbuf1, legato: 1.5, loop: 1,
dur: [0.1, 1.0].pwhite, startPos: [0, \crickets.buf.numFrames].pwhite) +> \test;
//:
\crickets.buf.numFrames;