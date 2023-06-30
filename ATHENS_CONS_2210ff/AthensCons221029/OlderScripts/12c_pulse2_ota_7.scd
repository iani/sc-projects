//========== PULSE 2 ==========//
//:phoenix
({
	var rte;
	rte = \x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 10);
	// rte = MouseY.kr(0.2, 10);	// test

	a = Impulse.ar(rte);
	a = EnvGen.ar(Env.perc(0.001, 0.2), a);
	a = PMOsc.ar(\freq.kr(4000.rand), 4000.rand, a, 0, a/1.5);
	a = Pan2.ar(a, -0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z7.bin > 0.5).lag(1);
} +> \ota7