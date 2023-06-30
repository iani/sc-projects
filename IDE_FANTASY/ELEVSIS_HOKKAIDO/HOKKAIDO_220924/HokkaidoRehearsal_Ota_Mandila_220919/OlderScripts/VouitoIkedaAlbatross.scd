{
	var key = \key.kr(32).midicps;
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.2).min(1);

	z = PMOsc.ar(key, key*2.5, amp**2*4, 0, amp/2);
	z = CombN.ar(z, 0.5, [0.23, 0.27], 1, 0.2, z);

	\amp.kr(0.4).lag(1) * z
	* (\z4.bin > 0.5).lag(1);
} +> \albatross;
