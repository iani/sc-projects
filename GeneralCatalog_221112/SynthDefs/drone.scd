SynthDef.new(\drone, {
	arg f0=20, flfo=0.01, rq=0.07, amp=0.5;
	var sig;
	sig = RLPF.ar(
		Pulse.ar([f0, (f0 + rand(3))], 0.3, 0.1), // in
		SinOsc.kr(flfo).range(40,100),  // cutoff freq
		0.07 // 1/Q
	);
	Out.ar(0, sig*amp);
}).add;