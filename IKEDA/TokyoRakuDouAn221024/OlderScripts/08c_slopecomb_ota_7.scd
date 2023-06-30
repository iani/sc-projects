//:
({
	var frq = Slope.kr(
		\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2);
		// MouseY.kr(0, 1).lag(1);			// test
	).abs.max(0.01).min(1);

	a = Impulse.ar(frq * \mul.kr(10));
	a = EnvGen.ar(Env.perc(0, 0.5), a);
	a = SinOsc.ar(a**30*2000+60, 0, a/2);
	a = HPF.ar(a, 50);
	b = (\root.kr(48) + [0, 5, 10]).midicps.reciprocal;
	c = CombN.ar(a, 0.1, b, 0.7, 0.5);
	a = Splay.ar(c) + a;
	a = FreeVerb2.ar(a[0], a[1], 0.1, 0.8);

	\amp.kr(1.0).lag(1) * a
	 * (\z7.bin > 0.5).lag(1);
} +> \ota7 )
