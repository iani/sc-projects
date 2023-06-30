{
	var pch =
	\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var amp = Slope.kr(
		\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	);

	amp = amp.abs.max(0.1).min(1);

	a = PMOsc.ar(10, 10/pch, 1)+1/2;
	b = LFSaw.ar(3)*amp;
	b = HPF.ar(b, a**2*1000);
	c = GVerb.ar(b/\div.kr(100), 1.5, \time.kr(1));
	z = HPF.ar(c, 150, 2) + HPF.ar(c, 800, 0.5);
	z = Limiter.ar(z, -1.dbamp);

	\amp.kr(0.2).lag(1) * z
	* (\z8.bin > 0.5).lag(1);
} +> \ota7_8;
