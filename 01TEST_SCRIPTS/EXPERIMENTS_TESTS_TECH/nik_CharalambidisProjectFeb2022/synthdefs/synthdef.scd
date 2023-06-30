~quant = 32;
TempoClock.default.tempo = 200/12;

SynthDef(\gogos, {|
	amp = 0.2,
	beat = 1,
	beatDiv = 4,
	release = 1,
	rate = 1,
	dur = 1,
	fFreq = 4000|
	var src, env, envgen, numFrames, pBeat;
	numFrames = \gogosm.buf.numFrames;
	pBeat =  (beat - 1) / beatDiv;
	env = Env.perc(attackTime: 0.5, releaseTime: release);
	envgen = EnvGen.kr(env, gate: 1, doneAction: 2, timeScale: 1/24);
	src = PlayBuf.ar(1, \gogosm.buf.bufnum, rate: rate, startPos: (numFrames * pBeat));
	src = LPF.ar(src, fFreq)!2;
	Out.ar(0, src * amp * envgen);
}).add;

SynthDef(\choir, {|
	amp = 0.2,
	beat = 1,
	beatDiv = 4,
	release = 1,
	rate = 1,
	dur = 1,
	fFreq = 4000,
	a = 1
	|
	var src, env, envgen, numFrames, pBeat;
	numFrames = \choir.buf.numFrames;
	pBeat =  (beat - 1) / beatDiv;
	env = Env.perc(attackTime: a, releaseTime: release);
	envgen = EnvGen.kr(env, gate: 1, doneAction: 2, timeScale: 1/24);
	src = PlayBuf.ar(2, \choir.buf.bufnum, rate: rate, startPos: (numFrames * pBeat), loop:1);
	src = LPF.ar(src, fFreq);
	Out.ar(0, src * amp * envgen);
}).add;

SynthDef(\pray, {|
	amp = 0.2,
	beat = 1,
	beatDiv = 4,
	release = 1,
	rate = 1,
	dur = 1,
	fFreq = 4000,
	a = 1
	|
	var src, env, envgen, numFrames, pBeat;
	numFrames = \prayingm.buf.numFrames;
	pBeat =  (beat - 1) / beatDiv;
	env = Env.perc(attackTime: a, releaseTime: release);
	envgen = EnvGen.kr(env, gate: 1, doneAction: 2, timeScale: 1/24);
	src = PlayBuf.ar(1, \prayingm.buf.bufnum, rate: rate, startPos: (numFrames * pBeat), loop:1);
	src = LPF.ar(src, fFreq)!2;
	Out.ar(0, src * amp * envgen);
}).add;

SynthDef(\metaloph, {|
	amp = 0.2,
	beat = 1,
	beatDiv = 4,
	release = 1,
	rate = 1,
	dur = 1,
	fFreq = 4000,
	a = 1
	|
	var src, env, envgen, numFrames, pBeat;
	numFrames = \metaloph.buf.numFrames;
	pBeat =  (beat - 1) / beatDiv;
	env = Env.perc(attackTime: a, releaseTime: release);
	envgen = EnvGen.kr(env, gate: 1, doneAction: 2, timeScale: 1/24);
	src = PlayBuf.ar(2, \metaloph.buf.bufnum, rate: rate, startPos: (numFrames * pBeat), loop:1);
	src = LPF.ar(src, fFreq);
	Out.ar(0, src * amp * envgen);
}).add;

SynthDef(\plane, {|
	amp = 0.2,
	beat = 1,
	beatDiv = 4,
	release = 1,
	rate = 1,
	dur = 1,
	fFreq = 4000,
	pan = 0,
	a = 0.1|
	var src, env, envgen, numFrames, pBeat, mod;
	mod = In.kr(133);
	numFrames = \whale.buf.numFrames;
	pBeat =  (beat - 1) / beatDiv;
	env = Env.perc(attackTime: a, releaseTime: release);
	envgen = EnvGen.kr(env, gate: 1, doneAction: 2, timeScale: 1/32);
	src = PlayBuf.ar(2, \whale.buf.bufnum, rate: rate, startPos: (numFrames * pBeat), loop:1);
	src = LPF.ar(src, (fFreq));// + (fFreq * mod)));
	Out.ar(0, src * amp * envgen, pan);
}).add;
