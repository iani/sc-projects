SynthDef(\crotales, {
	/*
		Author Unknown
		Modified by Bruno Ruviaro and Josh Mitchell 8/19.
	*/
	arg out = 0, freq = 261, tone = 3, atk = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5;

	var env, snd, mod;

	env = Env.perc(attackTime: atk, releaseTime: rel, curve: curve).kr(doneAction: 2);

	mod = Rand(modLo, modHi);

	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);

	snd = HPF.ar(snd, freq / 2);

	snd = Mix.ar(snd) * 0.1;

	Out.ar(out, Pan2.ar(snd, pan));
}).add