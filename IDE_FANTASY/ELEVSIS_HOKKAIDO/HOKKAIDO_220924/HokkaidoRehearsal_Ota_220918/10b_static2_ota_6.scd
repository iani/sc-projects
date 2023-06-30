//:========== STATIC 2 ==========//
({
	var pch;
	pch = \x6.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60);
	// pch = MouseY.kr(24, 60);	// test

	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (pch.midicps), 2.0.rand, 0.1) });
	a = LPF.ar(a, \bass.kr(150), 2, a);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a
	* (\z6.bin > 0.5).lag(1);
} +> \ota6 )
