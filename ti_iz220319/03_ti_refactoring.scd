(
{ | bus = 50 |
	var sig;
	sig = Mix.fill(1, {
		var fb, env, fq, fm, ev, mo, osc;

		a = LocalIn.ar;

		b = WhiteNoise.ar.linlin(-1, 1, 0.5, 1);

		c = Latch.ar(b, a);

		fb = (
			LFSaw.ar(c, 1)
			+ (\fadd.kr(0.5).linlin(0.47, 0.53, 0.1, 0.9) * 5 + 0.1 )
		) / (\ldiv.kr(0.5) * 1.0 + 1.3);

		LocalOut.ar(fb);


		env = 1-fb;
		fq = Latch.ar(WhiteNoise.ar(
			\noise.kr(0.5) + 1 ** 15 + 10)
			+ (\noisep.kr(0.6) + 1 ** 15 + 10), fb);
		ev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10);
		fm = fq * (\fqmul.kr(0.5) * 10 + 5/3);
		mo = SinOsc.ar(fm, 0, ev, fq);
		env = LPF.ar(env, 100);
		osc = SinOsc.ar(mo, 0, env);
		\amp.kr(1) * Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1), Changed.ar(fb)), 0.05);
	});

	Out.ar(0, sig.adsr);
} +> \peb;
)


(
scope{
	a = LocalIn.ar;
	a = LFSaw.ar(a%1*10+0.2);
	a = 1-a/2;
	b = WhiteNoise.ar;			// source of duration
	c = Latch.ar(b, a-0.001);	// trick for Latch
	LocalOut.ar(c);
	a;
};
)