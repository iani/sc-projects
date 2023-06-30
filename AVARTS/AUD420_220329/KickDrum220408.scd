SynthDef("KD", {
	arg freqA=1000, freqB=100, freqC=10, freqDur1=0.01, freqDur2=0.2, freqC1=1, freqC2=(-1),
	atk=0.01, rel=1, c1=1, c2=(-12), amp=0.8, pan=0, out=0;
	var sig, env, freqSweep;

	freqSweep=Env([freqA, freqB, freqC], [freqDur1, freqDur2], [freqC1, freqC2]).ar;
	env = Env([0, 1, 0], [atk, rel], [c1, c2]).kr(2);
	sig = SinOsc.ar(freqSweep, pi/2);
	sig = sig * env;
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;

//:
x = Synth(\KD, [\freqA, 1500]);

//:
(dur: [0.1, 0.1, 0.2].pseq, \instrument: \KD, freqA: [2000, 1000, 1500].pseq) +> \kickdrum;