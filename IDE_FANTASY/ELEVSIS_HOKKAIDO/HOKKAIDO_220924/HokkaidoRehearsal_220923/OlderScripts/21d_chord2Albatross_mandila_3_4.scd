{
	var key = \key.kr(33);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	\amp.kr(0.6).lag(1) * osc
	* (\z4.bin > 0.5).lag(1);
} +> \mandila3_4;
