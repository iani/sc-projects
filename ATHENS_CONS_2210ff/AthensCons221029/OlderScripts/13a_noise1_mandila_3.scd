//========== NOISE 1 ==========//
//:
({
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 14	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	(\z3.bin > 0.5).lag(1);
} +> \mandila3 )
