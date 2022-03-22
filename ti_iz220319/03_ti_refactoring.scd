(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 1, 0.999)/2;		// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10)
		+ (\noisep.kr(0.6) + 1 ** 15 + 10);
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10);
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3);
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100);
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4);
	}).adsr;
	\amp.kr(0.5).lag(1) * sig;
} +> \pebl;
)

\rtmin <+.pebl -5;
\rtmax <+.pebl 10;
\noise <+.pebl 0.2;
\noisep <+.pebl 0.5;
\oscamp <+.pebl 0.5;
\fqmul <+.pebl 0.1;
\amp <+.pebl 0.5;
\pebl.stop(2);

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

\srdiv <+.stdL 0.2
\stdk <+.stdL 2
\resfreq <+.stdL 0.12
\resbwr <+.stdL 0.4
\resinmul <+.stdL 0.1
\pos <+.stdL 0
\amp <+.stdL 0.5
\stdL.stop(2);