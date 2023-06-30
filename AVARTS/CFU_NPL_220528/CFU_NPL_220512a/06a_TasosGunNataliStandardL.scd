//: Repeat beats
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
} +> \tasos;

//: 2. StandardL algorithm.
{
	var div, sfq, std, rfq, rbw, res, mul, sig;
	div = \srdiv.kr(0.5).linlin(0, 1, 10, 100);			// srdiv
	sfq = SampleRate.ir / div;
	std = StandardL.ar(sfq, \stdk.kr(1));
	rfq = \resfreq.kr(0.2).linlin(0, 1, 10, 5000);		// resfreq
	rbw = \x3.bin.linlin(0.47, 0.56, 0.01, 100);		// resbwr
	res = Resonz.ar(std, rfq, rbw);
	mul = \z3.bin.linlin(0.47, 0.56, 500, 50000);		// resinmul
	sig = SinOsc.ar(res * mul);
	// sig = \amp.kr(0.2).lag(1) * sig;
	// sig = Pan2.ar(sig, \pos.kr(0)).adsr;
	// \amp.kr(0.05).lag(1) * sig
	// * (\z2.bin > 0.5).lag(1);		// gate
	sig = sig.adsr * 0.1 * (\z4.bin > 0.5).lag(0.1);
	sig = sig.dup;
	Out.ar(0, sig);
} +> \natali;
