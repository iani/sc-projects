//========== PULSE 2 ==========//
//:phoenix
// using pinetime data range -1200 - 1200
{
	var rte;
	rte = \x8.bamp(0.1, 0.5).linlin(-1200.0, 1200.0, 0.2, 10);
	// rte = MouseY.kr(0.2, 10);	// test

	a = Impulse.ar(rte);
	a = EnvGen.ar(Env.perc(0.001, 0.2), a);
	a = PMOsc.ar(\freq.kr(4000.rand), 4000.rand, a, 0, a/1.5);
	a = Pan2.ar(a, -0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z8.bin > 0.0).lag(1);
} +> \d8
