// Based on A.Broz: Shepard-Risset glissando demo (2020-10-31)
// http://sccode.org/1-5ee

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
	sig = sig.dup * \amp.kr(0.5);
	Out.ar(0, sig);
} +> \tasos;
