//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, fqm, fqa, ovt, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.2), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);	// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;

		fqm = \fqmul.kr(0.2).lincurve(0, 1, 0, 80, -1).midicps;		// freq mul
		fqm = WhiteNoise.ar(fqm);
		fqa = \fqadd.kr(0.5).lincurve(0, 1, 0, 120, -1).midicps;	// freq add
		fqm = fqm + fqa;
		fqm = Latch.ar(fqm, saw);

		ovt = \fqovt.kr(0.3).linlin(0, 1, 0, 10000);	// overtone
		ovt = env ** \curve.kr(10) * ovt;				// curve
		mod = \fqmod.kr(0.6).lincurve(0, 1, 0, 8, 2);	// mod freq
		mod = fqm * mod;

		mod = SinOsc.ar(mod, 0, ovt, fqm);
		env = LPF.ar(env, 100);		// de-click
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4);		// mix down 4 channels at 1/4 amp
	}).adsr;
	\amp.kr(0.05).lag(1) * sig;
} +> \pebl;
)
//:



//:
(
//: 2. StandardL algorithm.
{
	var div, sfq, std, rfq, rbw, res, mul, sig;
	div = \srdiv.kr(0.5).linlin(0, 1, 10, 100);
	sfq = SampleRate.ir / div;
	std = StandardL.ar(sfq, \stdk.kr(1));
	rfq = \resfreq.kr(0.2).linlin(0, 1, 10, 5000);
	rbw = \resbwr.kr(0.01).linlin(0, 1, 0.01, 100);
	res = Resonz.ar(std, rfq, rbw);
	mul = \resinmul.kr(0.1).linlin(0, 1, 500, 50000);
	sig = SinOsc.ar(res * mul);
	sig = \amp.kr(0.2).lag(1) * sig;
	Pan2.ar(sig, \pos.kr(0)).adsr;
} +> \stdL;
)
//:



// Based on A.Broz: Shepard-Risset glissando demo (2020-10-31)
// http://sccode.org/1-5ee
(
// 3. Shepard tone
{ |freq=440, amp=0.2|
	var partialCount = 5;
	var octRange = 2 ** (partialCount / 2);
	var fq = -1;
	var dur = 1 / fq.abs;
	var dir = fq / fq.abs;

	var cycle = 1 / (partialCount * dur) * dir;
	// var width = if(direction >= 0, 1, 0);
	var sig = partialCount.collect { |n|
		var offset = n / partialCount;
		var phase = (3 * pi / 2) + (2 * pi * offset);
		var vol = SinOsc.kr(cycle, phase).range(0, 1);
		// var ratio = VarSaw.kr(cycle, offset, width);
		var ip = 2 * offset + 1;
		var ratio = LFSaw.kr(cycle, ip);

		ip.poll;


		ratio = ratio.exprange(1/octRange, octRange);
		SinOsc.ar(freq * ratio) * vol;
	}.sum;
	sig = sig!2 * (amp / partialCount); //* Line.kr(0, 1, 5); // fade in
	// sig = JPverb.ar(sig); // reverb
	 dir.poll;
	Out.ar(0, sig);
} +> \shep;
)
