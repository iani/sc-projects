//========== SAMPLE AND HOLD 1 ==========//
//:
({
	var frq;
	frq = \x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseY.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	c = c * 1000 + 100;
	c = Lag.ar(c, 0.05);
	a = PMOsc.ar(c, c, 4);
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -6.dbamp);
	a = Pan2.ar(a, -0.7);

	\amp.kr(0.5).lag(1) * a
	* (\z5.bin > 0.5).lag(1);
} +> \ota5 )
