//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, fqm, fqa, ovt, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(1), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);	// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;

		fqm = \fqmul.kr(0.3).lincurve(0, 1, 0, 80, -1).midicps;		// freq mul
		fqm = WhiteNoise.ar(fqm);
		fqa = \x1.bin.lincurve(0.47, 0.56, 0, 120, -1).midicps;		// freq add
		fqm = fqm + fqa;
		fqm = Latch.ar(fqm, saw);

		ovt = \fqovt.kr(0.8).linlin(0, 1, 0, 10000);	// overtone
		ovt = env ** \curve.kr(10) * ovt;				// curve
		mod = \z1.bin.lincurve(0.47, 0.56, 0, 8, 2);	// mod freq
		mod = fqm * mod;

		mod = SinOsc.ar(mod, 0, ovt, fqm);
		env = LPF.ar(env, 100);		// de-click
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4);		// mix down 4 channels at 1/4 amp
	}).adsr;
	\amp.kr(0.1).lag(1) * sig
	* (\z2.bin > 0.5).lag(1);		// gate
} +> \albatross1;
)