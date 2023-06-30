//: Repeat beats
{
	var trg, env, frq, sig;
	trg = \x3.bin.linlin(0.47, 0.56, 0.2, 20);
	trg = Impulse.ar(trg);
	env = EnvGen.ar(Env.perc(0, 0.5), trg);
	frq = \z3.bin.linlin(0.47, 0.56, 100, 8000);
	frq = env ** 20 * frq + 50;
	sig = SinOsc.ar(frq, 0, env);
	sig = \amp.kr(0.2).lag(1) * sig!2;
	sig = sig.adsr * (\z4.bin > 0.5).lag(0.1);
	Out.ar(0, sig);
} +> \tasos