//:========== STATIC ==========//

({
	var pch;
	pch = \x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 72);
	// pch = MouseX.kr(36, 72);	// test

	a = (0..4)*5.5 + pch;
	a = Mix(SinOsc.ar(a.midicps, 0, 0.15));
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a *
	(\z5.bin > 0.5).lag(0.1);
} +> \ota5 )
