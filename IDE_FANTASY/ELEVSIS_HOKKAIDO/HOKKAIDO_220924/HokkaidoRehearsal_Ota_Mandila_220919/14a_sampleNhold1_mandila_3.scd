//========== SAMPLE AND HOLD 1 ==========//
//:
(
{
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a *
	(\z3.bin > 0.5).lag(1);
} +> \mandila3
)
