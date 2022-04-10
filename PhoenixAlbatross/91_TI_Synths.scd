//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, fqm, fqa, ovt, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(-2), \rtmax.kr(-0.5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);	// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;

		fqm = \fqmul.kr(0.7).lincurve(0, 1, 0, 80, -1).midicps;		// freq mul
		fqm = WhiteNoise.ar(fqm);
		fqa = \x1.bin.lincurve(0.47, 0.56, 0, 120, -1).midicps;		// freq add
		fqm = fqm + fqa;
		fqm = Latch.ar(fqm, saw);

		ovt = \x2.bin.lincurve(0.47, 0.56, 0, 10000);	// overtone
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
	rfq = \resfreq.kr(0.05).linlin(0, 1, 10, 5000);		// resfreq
	rbw = \x1.bin.linlin(0.47, 0.56, 0.01, 100);		// resbwr
	res = Resonz.ar(std, rfq, rbw);
	mul = \z1.bin.linlin(0.47, 0.56, 500, 50000);		// resinmul
	sig = SinOsc.ar(res * mul);
	// sig = \amp.kr(0.2).lag(1) * sig;
	sig = Pan2.ar(sig, \x2.bin.linlin(0.47, 0.56, -1, 1)).adsr;
	\amp.kr(0.05).lag(4) * sig
	* (\z2.bin > 0.5).lag(1);		// gate
} +> \phoenix;
)


// Based on A.Broz: Shepard-Risset glissando demo (2020-10-31)
// http://sccode.org/1-5ee
(
// 3. Shepard tone
{
	var freq = \freq.kr(100);
	var amp = \amp.kr(0.5);
	var interval = \itv.kr(1.5).max(1.15);
	var partialCount = 20;
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
	sig = JPverb.ar(sig); // reverb
	sig = amp.lag(1) * sig.adsr * (\x2.bin > 0.5).lag(2);
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
	sig = \amp.kr(0.2).lag(1) * sig;
	sig = sig.adsr * (\z2.bin > 0.5).lag(0.1);
	sig = FreeVerb2.ar(sig, sig, 0.2, 0.7);
	Out.ar(0, sig);
} +> \phoenix;
)


// Repeat chords
(
{
	var chd, trg, env, kik, sig, rev;
	chd = [0, 5, 7, 10] + 60;
	trg = MouseX.kr.linexp(0, 1, 0.3, 10);
	trg = Impulse.kr(trg);
	env = EnvGen.ar(Env.perc(0, 1), trg) ** 4;
	kik = env ** 4 * 200 + 50;
	kik = SinOsc.ar(kik, 0, env) ** 0.7;
	sig = chd.collect{|e|
		var frq = e.midicps;
		PMOsc.ar(frq, frq*3.5, env*2, 0, env / chd.size / 2);
	}.sum + kik;
	rev = MouseY.kr.linlin(0, 1, -1, 1).abs ** 2;
	rev = Latch.kr(rev, trg).lag(0.1);
	sig = FreeVerb2.ar(rev*sig, rev*sig, 1, 0.8, 0.3) + (1-rev*sig);
	sig = \amp.kr(0.5).lag(1) * sig.adsr;
	Out.ar(0, sig);
} +> \phoenix;
)


// (Not Random) Arpeggio
(
{
	var frq, trg, sig, res, pan;
	trg = \x1.bin.linlin(0.47, 0.56, 1, 10);
	trg = Impulse.ar(trg);
	frq = LFSaw.ar(10000).abs;
	frq = Latch.ar(frq, trg);
	frq = frq * 2000;
	sig = SinOsc.ar(frq.lag(0.02), 0, 0.03);
	res = \z1.bin.linlin(0.47, 0.56, 0.01, 0.05);
	sig = CombN.ar(sig, 0.1, res, res*50);
	pan = \z2.bin.linlin(0.47, 0.56, -1, 1);
	sig = Pan2.ar(sig, pan);
	sig = sig.adsr * (\x2.bin > 0.5).lag(2);
	Out.ar(0, sig);
} +> \phoenix;
)


// BPF & RM Pebble
(
{
	var fqa, frq, trg, sig, rng, pan;
	trg = Dust.ar(10);
	frq = LFNoise0.ar(100).abs;
	frq = Latch.ar(frq, trg);
	fqa = \x1.bin.linlin(0.47, 0.56, 100, 5000);
	frq = frq * fqa*2 + fqa;
	sig = BPF.ar(trg, frq, 0.01, 70);
	rng = \z1.bin.linlin(0.47, 0.56, 50, 10000);
	sig = SinOsc.ar(rng, 0, sig);
	pan = \z2.bin.linlin(0.47, 0.56, -1, 1);
	sig = Pan2.ar(sig, pan);
	sig = FreeVerb2.ar(sig[0], sig[1], 0.1, 0.7);
	sig = sig.adsr * (\x2.bin > 0.5).lag(2);
	Out.ar(0, sig!2);
} +> \phoenix;
)


// Echo
(
{
	var frq, trg, sig, res, pan;
	frq = \x1.bin.linlin(0.47, 0.56, 12, 120);
	frq = frq.midicps;
	sig = SinOsc.ar(frq.lag(1), 0, 0.1);
	res = \z1.bin.linlin(0.47, 0.56, 0.01, 0.1);
	sig = CombL.ar(sig, 0.1, res, res*50);
	pan = \z2.bin.linlin(0.47, 0.56, -1, 1);
	sig = Pan2.ar(sig, pan);
	sig = DelayL.ar(sig, 0.1, SinOsc.ar(30, 0, 0.001, 0.001));
	sig = sig.adsr * (\x2.bin > 0.5).lag(2);
	Out.ar(0, sig);
} +> \phoenix;
)


{ SinOsc.ar(100, 0, 0.1)!2 } +> \phoenix;

s.scope;
s.meter(2,2);