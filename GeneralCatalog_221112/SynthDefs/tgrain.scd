SynthDef(\tgrain, {
	/*
		// https://hvc.berlin/Processed_Recording/supercollider-granular-example/
	*/
	|
	bufnum = nil,
	pan = 0.0,
	amp = 0.0,
	trate = 12
	|
	var dur, clk, pos, sig;
	clk = Impulse.kr(trate);
	dur = TRand.kr(0.2,24,clk) / trate;
	//pos = MouseX.kr(0,BufDur.kr(bufnum)) + TRand.kr(0, 0.01, clk);
	pos = Rand(0.0 , BufDur.kr(bufnum)) + TRand.kr(0, 0.01, clk);
	//gpan = WhiteNoise.kr(0.6);
	sig = TGrains.ar(2, clk, bufnum, 1, pos, dur, pan, 0.1);
	//sig = Pan2.ar(sig, pan, amp);
	sig = sig * amp;
	Out.ar(0, sig)
}).add;