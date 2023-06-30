//========== PULSE 1 ==========//
//:phoenix
({
	var frq = 400.rand + 50;
	var rte;
	rte = \x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z5.bin > 0.5).lag(1);
} +> \ota5 )
