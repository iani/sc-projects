//========== SLOPE ==========//
//: KATHAK + Forsythe.
//// keeep this, use with sensor8 in left trouser pocket
{
	var key = \key.kr(32);
	var amp = Slope.kr(
	// less sensitive:
		// \x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
	// more sensitive:
	\x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 10).lag(0.5);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.00).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z5.bamp(0.1, 0.5).linexp(0.46, 0.57, 50, 100).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(
		osc,
		midicps(n*\itv.kr(5)+\y5.bamp(0.01, 0.05).linexp(0.46, 0.57, 50, 100)),
		0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z5.bin < 0.5).lag(1);
} +> \d5
