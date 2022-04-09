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
	\amp.kr(0.05).lag(1) * sig
	* (\z2.bin > 0.5).lag(1);		// gate
} +> \phoenix;
)


//:
// 2. StandardL algorithm.
(
{
	var div, sfq, std, rfq, rbw, res, mul, sig;
	div = \srdiv.kr(0.5).linlin(0, 1, 10, 100);			// srdiv
	sfq = SampleRate.ir / div;
	std = StandardL.ar(sfq, \stdk.kr(1));
	rfq = \resfreq.kr(0.2).linlin(0, 1, 10, 5000);		// resfreq
	rbw = \x1.bin.linlin(0.47, 0.56, 0.01, 100);		// resbwr
	res = Resonz.ar(std, rfq, rbw);
	mul = \z1.bin.linlin(0.47, 0.56, 500, 50000);		// resinmul
	sig = SinOsc.ar(res * mul);
	// sig = \amp.kr(0.2).lag(1) * sig;
	sig = Pan2.ar(sig, \pos.kr(0)).adsr;
	\amp.kr(0.05).lag(1) * sig
	* (\z2.bin > 0.5).lag(1);		// gate
} +> \phoenix;
)


// Based on A.Broz: Shepard-Risset glissando demo (2020-10-31)
// http://sccode.org/1-5ee
(
// 3. Shepard tone
{
	var freq = \freq.kr(200);
	var amp = \amp.kr(0.5);
	var interval = \itv.kr(1).max(1.15);
	var partialCount = 30;
	var octRange = interval ** (partialCount / 2);
	var fq = \x1.bin.linlin(0.47, 0.56, -1, 1);
	var duration = 1 / fq.abs;
	var direction = fq / fq.abs;
	var cycle = 1 / (partialCount * duration) * direction;
	var sig = partialCount.collect { |n|
		var offset = n / partialCount;
		var phase = (3 * pi / 2) + (2 * pi * offset);
		var vol = SinOsc.kr(cycle, phase).range(0, 1);
		var iphase = 2 * offset + 1;
		var ratio = LFSaw.kr(cycle, iphase);
		ratio = Wrap.kr(ratio, -1, 1);
		ratio = ratio.exprange(1/octRange, octRange);
		SinOsc.ar(freq * ratio) * vol;
	}.sum;
	sig = sig!2 * (amp / partialCount) * Line.kr(0, 1, 1); // fade in
	// sig = JPverb.ar(sig); // reverb
	sig = amp.lag(1) * sig.adsr * (\z2.bin > 0.5).lag(0.1);
	Out.ar(0, sig);
} +> \phoenix;
)


// Repeat beats
(
{
	var trg, env, frq, sig;
	trg = \x1.bin.linlin(0.47, 0.56, 0.2, 20);
	trg = Impulse.ar(trg);
	env = EnvGen.ar(Env.perc(0, 0.5), trg);
	frq = \z1.bin.linlin(0.47, 0.56, 100, 8000);
	frq = env ** 20 * frq + 50;
	sig = SinOsc.ar(frq, 0, env);
	sig = \amp.kr(0.2).lag(1) * sig!2;
	sig = sig.adsr * (\z2.bin > 0.5).lag(0.1);
	Out.ar(0, sig);
} +> \phoenix;
)