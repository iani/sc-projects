/*  7 Apr 2022 10:27
Tiny Birds
*/

//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
		var rate, phasor, sampleRate;
		sampleRate = SampleRate.ir;
		rate = \z1.bin.linlin(0.46, 0.57, -0.15, 0.15).round(0.2);
		phasor = Phasor.ar(1, (rate / sampleRate)
			* (\z2.bin > 0.5) // freeze position with right hand z
		).range(-2.6, -3.15);
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);// / 2; //2;		// 0.999 <- trick for Latch
		// saw = LFSaw.ar(rt, 1, 1, 0.999) / 2; //2;		// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10) // !
		// + (\noisep.kr(-2.6) + 1 ** 15 + 10); // !
		+ (phasor + 1 ** 15 + 10); // !
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10); // !
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3); // !
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100); // !
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4); // ! mix down 4 channels at 1/4 amp
	}).adsr;
	\amp.kr(0.05).lag(1) * sig;
} +> \pebl;
)
//:
{ var trig, rate, x, sr;

    // rate = MouseX.kr(0.2, 2, 1);
	// rate = \rate.kr(1);
	rate = \z1.bin.linlin(0.46, 0.7, -1, 1);
    trig = \trig.tr(0); // set this to restart the phasor
    sr = SampleRate.ir;
    x = Phasor.ar(trig, rate / sr);
    SinOsc.ar(
        [
            LinLin.kr(x, 0, 1, 600, 1000), // convert range from 0..1 to 600..1000
            1000 // constant second frequency
        ], 0, 0.02)

} +> \phasor
// =================== TINY BIRDS
\z1.bus.set(0.58);